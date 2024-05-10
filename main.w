bring cloud;
bring dynamodb;
bring "./src/handlers" as handlers;

let companyName = "ACME";

let sessionApi = new cloud.Api() as "{companyName}-Session-Api";
let sessionTable = new dynamodb.Table(
  name: "sessions",
  attributes: [
    {
      name: "sessionId",
      type: "S"
    },
  ],
  hashKey: "sessionId"
) as "{companyName}-Session-Table";

let basePath = "/sessions";

let getSessionHandler = new handlers.GetSessionHandler(sessionTable) as "{companyName}-GET-Session";
let postSessionHandler = new handlers.PostSessionHandler(sessionTable) as "{companyName}-POST-Session";
let putSessionHandler = new handlers.PutSessionHandler(sessionTable) as "{companyName}-PUT-Session";

sessionApi.get(basePath, inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
  if (request.query.has("sessionId")) {
    let sessionId = request.query.get("sessionId");

    if (sessionId == "") {
      return cloud.ApiResponse {
        status: 400,
        body: "No sessionId provided"
      };
    }

    let response = getSessionHandler(sessionId);

    if (Json.parse(response!).has("error")) {
      return cloud.ApiResponse {
        status: 400,
        body: response
      };
    }

    return cloud.ApiResponse {
      status: 200,
      headers: {
        "Content-Type" => "application/json"
      },
      body: response
    };
  }

  return cloud.ApiResponse {
    status: 404,
  };
});

sessionApi.post("{basePath}", inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
  let sessionId = postSessionHandler.handle();

  return cloud.ApiResponse {
    status: 201,
    headers: {
      "Content-Type" => "application/json"
    },
    body: Json.stringify({sessionId: sessionId})
  };

});

sessionApi.put("{basePath}/:sessionId", inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
  if (request.vars.has("sessionId")) {
    let sessionId = request.vars.get("sessionId");
    let output = putSessionHandler.handle(sessionId);
    log(output!);

    return cloud.ApiResponse {
      status: 200,
      headers: {
        "Content-Type" => "application/json"
      },
      body: Json.stringify({sessionId: sessionId})
    };
  }

  return cloud.ApiResponse {
    status: 404,
  };
});
bring cloud;
bring "./src/handlers" as handlers;

let companyName = "ACME";

let sessionApi = new cloud.Api() as "{companyName}-Session-Api";

let basePath = "/sessions";

let getSessionHandler = new handlers.GetSessionHandler() as "{companyName}-GET-Session";
let postSessionHandler = new handlers.PostSessionHandler() as "{companyName}-POST-Session";
let putSessionHandler = new handlers.PutSessionHandler() as "{companyName}-PUT-Session";

sessionApi.get(basePath, inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
  if (request.query.has("sessionId")) {
    let sessionId = request.query.get("sessionId");

    if (sessionId == "") {
      return cloud.ApiResponse {
        status: 400,
        body: "No sessionId provided"
      };
    }

    return cloud.ApiResponse {
      status: 200,
      body: "Fetching data for sessionId={getSessionHandler.handle(sessionId)!}"
    };
  }

  return cloud.ApiResponse {
    status: 404,
  };
});

sessionApi.post("{basePath}", inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
  let output = postSessionHandler.handle();

  return cloud.ApiResponse {
    status: 201,
    body: "Created new sessionId: {output!}"
  };

});

sessionApi.put("{basePath}/:sessionId", inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
  if (request.vars.has("sessionId")) {
    let sessionId = request.vars.get("sessionId");
    let output = putSessionHandler.handle(sessionId);
    log(output!);

    return cloud.ApiResponse {
      status: 200,
      body: "Updated session with sessionId: {sessionId}"
    };
  }

  return cloud.ApiResponse {
    status: 404,
  };
});
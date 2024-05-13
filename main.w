bring cloud;
bring dynamodb;
bring util;
bring "./src/handlers" as handlers;
bring "./src/types.w" as types;

let companyName = util.env("ORGANISATION_NAME");
let AwsRegion = util.env("AWS_REGION");

let sessionApi = new cloud.Api() as "{companyName}-Session-Api";
let sessionTable = new dynamodb.Table(
  name: "sessions",
  attributes: [
    {
      name: "sessionId",
      type: "S"
    },
  ],
  hashKey: "sessionId",
) as "{companyName}-Session-Table";

let sessionDbConnection: dynamodb.Connection = {
  tableName: sessionTable.tableName,
  clientConfig: {
    endpoint: "http://localhost:3000",
    region: AwsRegion,
    credentials: {
      accessKeyId: "local",
      secretAccessKey: "local"
    },
  }
};

log(util.env("WING_TARGET"));

let basePath = "/sessions";

let handlerOptions: types.SessionHandlerOptions = {
  table: sessionTable,
  region: AwsRegion,
};

let getSessionHandler = new handlers.GetSessionHandler(handlerOptions) as "{companyName}-GET-Session";
let postSessionHandler = new handlers.PostSessionHandler(handlerOptions) as "{companyName}-POST-Session";
let putSessionHandler = new handlers.PutSessionHandler(handlerOptions) as "{companyName}-PUT-Session";

sessionApi.get(basePath, inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
  if (request.query.has("sessionId")) {
    let sessionId = request.query.get("sessionId");

    if (sessionId == "") {
      return cloud.ApiResponse {
        status: 400,
        headers: {
          "Content-Type" => "text/plain"
        },
        body: "No sessionId provided"
      };
    }

    let session = getSessionHandler(sessionId);

    if (Json.parse(session!).has("error")) {
      return cloud.ApiResponse {
        status: 400,
        headers: {
          "Content-Type" => "application/json"
        },
        body: session
      };
    }

    return cloud.ApiResponse {
      status: 200,
      headers: {
        "Content-Type" => "application/json"
      },
      body: session
    };
  }

  return cloud.ApiResponse {
    status: 404,
    headers: {
      "Content-Type" => "text/plain"
    },
  };
});

sessionApi.post("{basePath}", inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
  let session = postSessionHandler.handle();

  return cloud.ApiResponse {
    status: 201,
    headers: {
      "Content-Type" => "application/json"
    },
    body: session
  };

});

sessionApi.put("{basePath}/:sessionId", inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
  if (request.vars.has("sessionId")) {
    let sessionId = request.vars.get("sessionId");
    let session = putSessionHandler.handle(sessionId);
    log(session!);

    return cloud.ApiResponse {
      status: 200,
      headers: {
        "Content-Type" => "application/json"
      },
      body: session
    };
  }

  return cloud.ApiResponse {
    status: 404,
    headers: {
      "Content-Type" => "text/plain"
    },
  };
});
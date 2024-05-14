bring cloud;
bring dynamodb;
bring util;
bring "./src/handlers" as handlers;
bring "./src/types.w" as types;
bring "./src/ports" as ports;

let companyName = util.env("ORGANISATION_NAME");
let AwsRegion = util.env("AWS_REGION");

let sessionApi = new cloud.Api() as "{companyName}-Session-Api";
let sessionTable = new ports.SessionTable("sessions") as "{companyName}-Session-Table";

let basePath = "/sessions";

let handlerOptions: types.SessionHandlerOptions = {
  table: sessionTable,
  region: AwsRegion,
};

let getSessionHandler = new handlers.GetSessionHandler(handlerOptions) as "{companyName}-GetSessionFn";
let createSessionHandler = new handlers.CreateSessionHandler(handlerOptions) as "{companyName}-CreateSessionFn";
let putSessionHandler = new handlers.UpdateSessionHandler(handlerOptions) as "{companyName}-UpdateSessionFn";

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

sessionApi.post("{basePath}/new", inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
  let session = createSessionHandler.handle();

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

    log("body={request.body!}");

    let requestData = Json.tryParse(request.body);

    if (requestData == nil) {
      return cloud.ApiResponse {
        status: 400,
        headers: {
          "Content-Type" => "text/plain"
        },
        body: "Invalid request data"
      };
    }

    let user = types.User.tryFromJson(requestData!.get("user"));

    if (user == nil) {
      return cloud.ApiResponse {
        status: 400,
        headers: {
          "Content-Type" => "text/plain"
        },
        body: "Invalid User data"
      };
    }

    log("User={Json.stringify(user)}");

    let sessionRequest = types.SessionRequest.fromJson({
      sessionId: request.vars.get("sessionId"),
      user: user,
    });

    let session = putSessionHandler.handle(Json.stringify(sessionRequest));
    log(session!);

    if (session == nil) {
      return cloud.ApiResponse {
        status: 400,
        headers: {
          "Content-Type" => "text/plain"
        },
        body: "Could not save Session data"
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
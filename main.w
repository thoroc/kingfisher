bring cloud;
bring dynamodb;
bring util;
bring "./src/handlers" as handlers;
bring "./src/types.w" as types;
bring "./src/ports" as ports;
bring "./src/http" as http;

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
let closeSessionHandler = new handlers.CloseSessionHandler(handlerOptions) as "{companyName}-CloseSessionFn";

sessionApi.get(basePath, inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
  if (request.query.has("sessionId")) {
    let sessionId = request.query.get("sessionId");

    if (sessionId == "") {
      let httpStatus = http.HttpStatusTransformer.fromStatusEnum(http.HttpStatuses.BAD_REQUEST);

      return cloud.ApiResponse {
        status: httpStatus.code,
        headers: {
          "Content-Type" => "text/plain"
        },
        body: "{httpStatus.message} - sessionId is required"
      };
    }

    let session = getSessionHandler(sessionId);

    if (Json.parse(session!).has("error")) {
      let error = Json.parse(session!).get("error");

      return cloud.ApiResponse {
        status: error.get("code").asNum(),
        headers: {
          "Content-Type" => "application/json"
        },
        body: error.get("message").asStr(),
      };
    }

    let httpStatus = http.HttpStatusTransformer.fromStatusEnum(http.HttpStatuses.OK);

    return cloud.ApiResponse {
      status: httpStatus.code,
      headers: {
        "Content-Type" => "application/json"
      },
      body: session
    };
  }

  let httpStatus = http.HttpStatusTransformer.fromStatusEnum(http.HttpStatuses.NOT_FOUND);

  return cloud.ApiResponse {
    status: httpStatus.code,
    headers: {
      "Content-Type" => "text/plain"
    },
    body: httpStatus.message
  };
});

// Create a new session
sessionApi.post("{basePath}/new", inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
  let session = createSessionHandler.handle();
  log("Create Session Response={session!}");

  if (Json.parse(session!).has("error")) {
    let error = Json.parse(session!).get("error");

    return cloud.ApiResponse {
      status: error.get("code").asNum(),
      headers: {
        "Content-Type" => "application/json"
      },
      body: error.get("message").asStr(),
    };
  }

  let httpStatus = http.HttpStatusTransformer.fromStatusEnum(http.HttpStatuses.CREATED);

  return cloud.ApiResponse {
    status: httpStatus.code,
    headers: {
      "Content-Type" => "application/json"
    },
    body: session
  };
});

// Update a session
sessionApi.put("{basePath}/:sessionId", inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
  if (request.vars.has("sessionId")) {

    log("body={request.body!}");

    let requestData = Json.tryParse(request.body);

    if (requestData == nil) {
      let httpStatus = http.HttpStatusTransformer.fromStatusEnum(http.HttpStatuses.BAD_REQUEST);

      return cloud.ApiResponse {
        status: httpStatus.code,
        headers: {
          "Content-Type" => "text/plain"
        },
        body: httpStatus.message
      };
    }

    let user = types.User.tryFromJson(requestData!.get("user"));

    if (user == nil) {
      let httpStatus = http.HttpStatusTransformer.fromStatusEnum(http.HttpStatuses.BAD_REQUEST);

      return cloud.ApiResponse {
        status: httpStatus.code,
        headers: {
          "Content-Type" => "text/plain"
        },
        body: httpStatus.message
      };
    }

    log("User={Json.stringify(user)}");

    let sessionRequest = types.SessionRequest.fromJson({
      sessionId: request.vars.get("sessionId"),
      user: user,
    });

    let session = putSessionHandler.handle(Json.stringify(sessionRequest));
    log("Update Session Response={session!}");

    if (Json.parse(session!).has("error")) {
      let error = Json.parse(session!).get("error");

      return cloud.ApiResponse {
        status: error.get("code").asNum(),
        headers: {
          "Content-Type" => "application/json"
        },
        body: error.get("message").asStr(),
      };
    }

    let httpStatus = http.HttpStatusTransformer.fromStatusEnum(http.HttpStatuses.OK);

    return cloud.ApiResponse {
      status: httpStatus.code,
      headers: {
        "Content-Type" => "application/json"
      },
      body: session
    };
  }

  let httpStatus = http.HttpStatusTransformer.fromStatusEnum(http.HttpStatuses.NOT_FOUND);

  return cloud.ApiResponse {
    status: httpStatus.code,
    headers: {
      "Content-Type" => "text/plain"
    },
    body: httpStatus.message
  };
});

// Close a session
sessionApi.put("{basePath}/:sessionId/close", inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
  if (request.vars.has("sessionId")) {

    let sessionRequest = types.SessionRequest.fromJson({
      sessionId: request.vars.get("sessionId"),
    });

    let session = closeSessionHandler.handle(Json.stringify(sessionRequest));
    log("Close Session Response={session!}");

    if (Json.parse(session!).has("error")) {
      let error = Json.parse(session!).get("error");

      return cloud.ApiResponse {
        status: error.get("code").asNum(),
        headers: {
          "Content-Type" => "application/json"
        },
        body: error.get("message").asStr(),
      };
    }

    let httpStatus = http.HttpStatusTransformer.fromStatusEnum(http.HttpStatuses.OK);

    return cloud.ApiResponse {
      status: httpStatus.code,
      headers: {
        "Content-Type" => "application/json"
      },
      body: session
    };
  }

  let httpStatus = http.HttpStatusTransformer.fromStatusEnum(http.HttpStatuses.NOT_FOUND);

  return cloud.ApiResponse {
    status: httpStatus.code,
    headers: {
      "Content-Type" => "text/plain"
    },
    body: httpStatus.message
  };
});
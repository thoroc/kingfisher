bring cloud;
bring "./src/handlers" as handlers;

let sessionApi = new cloud.Api();

let basePath = "/sessions";

sessionApi.get(basePath, inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
  if (request.query.has("sessionId")) {
    let sessionId = request.query.get("sessionId");

    if (sessionId == "") {
      return cloud.ApiResponse {
        status: 400,
        body: "No sessionId provided"
      };
    }

    let output = handlers.GetSessionHandler.invoke(sessionId);

    return cloud.ApiResponse {
      status: 200,
      body: output
    };
  }

  return cloud.ApiResponse {
    status: 404,
  };
});

sessionApi.post("{basePath}/:sessionId", inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
  if (request.vars.has("sessionId")) {
    return cloud.ApiResponse {
      status: 201,
      body: "Created new sessionId"
    };
  }

  return cloud.ApiResponse {
    status: 404,
  };
});
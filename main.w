bring cloud;
bring "./src/handlers" as handlers;

let sessionApi = new cloud.Api();

let basePath = "/sessions";

let getSessionHandler = new handlers.GetSessionHandler();
let postSessionHandler = new handlers.PostSessionHandler();

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
      body: getSessionHandler.handle(sessionId)
    };
  }

  return cloud.ApiResponse {
    status: 404,
  };
});

sessionApi.post("{basePath}/:sessionId", inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
  if (request.vars.has("sessionId")) {
    let sessionId = request.vars.get("sessionId");
    let output = postSessionHandler.handle(sessionId);
    log(output!);

    return cloud.ApiResponse {
      status: 201,
      body: "Created new sessionId"
    };
  }

  return cloud.ApiResponse {
    status: 404,
  };
});
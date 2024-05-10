bring cloud;

let sessionApi = new cloud.Api();

let basePath = "/sessions";

let getSessionsHandler = new cloud.Function(inflight (event: str?): str? => {
  log(event!);

  return "hello World!";
});

sessionApi.get(basePath, inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
  if (request.query.has("sessionId")) {
    let sessionId = request.query.get("sessionId");

    return cloud.ApiResponse {
      status: 200,
      body: "Hello {sessionId}"
    };
  }

  return cloud.ApiResponse {
    status: 404,
  };
});
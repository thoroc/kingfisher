bring cloud;

let sessionApi = new cloud.Api();

let basePath = "/sessions";

let getSessionsHandler = new cloud.Function(inflight (event: str?): str? => {
  log(event!);

  return "hello World!";
});

sessionApi.get(basePath, inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
  
  log("Method: {request.method}");

  log("Path: {request.path}");

  let queryEntries: str = request.query.entries().join();
  log("Query: {queryEntries}");

  let sessionIdFromQuery = (() => {
    if (request.query.has("sessionId")) {
      return request.query.get("sessionId");
    }

    return "sessionId is not available in the query";
  })();
  log("sessionId from Query: {sessionIdFromQuery}");


  return cloud.ApiResponse {
    status: 200,
    body: "Hello world!"
  };
});
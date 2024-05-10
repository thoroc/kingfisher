bring cloud;

let sessionApi = new cloud.Api();

let basePath = "/sessions";

let getSessionsHandler = new cloud.Function(inflight () => {
  return "hello World!";
});

sessionApi.get(basePath, inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
  
  log("Method: {request.method}");

  log("Path: {request.path}");

  let queryEntries = request.query.entries().join();
  log("Query: {queryEntries}");

  let sessionIdFromQuery = (() => {
    if (request.query.has("sessionId")) {
      return request.query.get("sessionId");
    }

    return "sessionId is not available in the query";
  })();
  log("sessionId from Query: {sessionIdFromQuery}");

  let varsEntries = request.vars.entries().join();
  log("Vars: {varsEntries}");

  log("Vars Keys: {request.vars.keys().join()}");

  let sessionIdFromVars = (() => {
    if (request.vars.has("sessionId")) {
      return request.vars.get("sessionId");
    }

    return "sessionId is not available in the vars";
  })(); 

  log("SessionId from Vars: {sessionIdFromVars}");

  log("Body: {request.body!}");

  let headers = request?.headers?.entries()?.join();
  log("Headers: {headers!}");
  let headerKeys = request?.headers?.keys()?.join();
  log("Header available: {headerKeys!}");

  return cloud.ApiResponse {
    status: 200,
    body: "Hello world!"
  };
});
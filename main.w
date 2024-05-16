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

let handlerOptions: handlers.SessionHandlerOptions = {
  table: sessionTable,
  region: AwsRegion,
};

let getSessionHandler = new handlers.GetSessionHandler(handlerOptions) as "{companyName}-GetSessionFn";

// Get a session
sessionApi.get("{basePath}/:sessionId", inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
  return getSessionHandler.handle(request);
});

let createSessionHandler = new handlers.CreateSessionHandler(handlerOptions) as "{companyName}-CreateSessionFn";
// Create a new session
sessionApi.post("{basePath}/new", inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
  return createSessionHandler.handle(request);
});

let updateSessionHandler = new handlers.UpdateSessionHandler(handlerOptions) as "{companyName}-UpdateSessionFn";
// Update a session
sessionApi.put("{basePath}/:sessionId", inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
  return updateSessionHandler.handle(request);
});

let closeSessionHandler = new handlers.CloseSessionHandler(handlerOptions) as "{companyName}-CloseSessionFn";
// Close a session
sessionApi.post("{basePath}/:sessionId/close", inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
  return closeSessionHandler.handle(request);
});
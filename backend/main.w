bring cloud;
bring dynamodb;
bring util;
bring vite;
bring "./SessionManager/handlers" as handlers;
bring "./SessionManager/ports" as ports;


let companyName = util.env("ORGANISATION_NAME");
let AwsRegion = util.env("AWS_REGION");

// let sessionApi = new cloud.Api(cors: true) as "{companyName}-Session-Api";
let sessionTable = new ports.SessionTable("sessions") as "{companyName}-Session-Table";

let basePath = "/sessions";

let handlerOptions: handlers.SessionHandlerOptions = {
  table: sessionTable,
  region: AwsRegion,
};

let createSessionHandler = new handlers.CreateSessionHandler(handlerOptions) as "{companyName}-CreateSessionFn";
// Create a new session
// sessionApi.post("{basePath}/new", inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
//   return createSessionHandler.handle(request);
// });

let getSessionHandler = new handlers.GetSessionHandler(handlerOptions) as "{companyName}-GetSessionFn";
// Get a session
// sessionApi.get("{basePath}/:sessionId", inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
//   return getSessionHandler.handle(request);
// });

let listSessionsHandler = new handlers.ListSessionsHandler(handlerOptions) as "{companyName}-ListSessionsFn";
// List all sessions
// sessionApi.get("{basePath}", inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
//   return listSessionsHandler.handle(request);
// });

let updateSessionHandler = new handlers.UpdateSessionHandler(handlerOptions) as "{companyName}-UpdateSessionFn";
// Update a session
// sessionApi.put("{basePath}/:sessionId", inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
//   return updateSessionHandler.handle(request);
// });

let closeSessionHandler = new handlers.CloseSessionHandler(handlerOptions) as "{companyName}-CloseSessionFn";
// Close a session
// sessionApi.post("{basePath}/:sessionId/close", inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
//   return closeSessionHandler.handle(request);
// });

let newApi = new ports.SessionApi({}) as "{companyName}-Session-Api-Port";

newApi.post("{basePath}/new", createSessionHandler);
newApi.get("{basePath}/:sessionId", getSessionHandler);
newApi.put("{basePath}/:sessionId", updateSessionHandler);
newApi.post("{basePath}/:sessionId/close", closeSessionHandler);

new vite.Vite(
  root: "{@dirname}/../frontend",
  publicEnv: {
    TITLE: "Wing + Vite + React",
    API_URL: newApi.api.url
  }
) as "{companyName}-Vite";
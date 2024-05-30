bring cloud;
bring dynamodb;
bring util;
bring vite;
bring "./SessionManager/handlers" as handlers;
bring "./SessionManager/ports" as ports;


let companyName = util.env("ORGANISATION_NAME");
let AwsRegion = util.env("AWS_REGION");

let newApi = new ports.SessionApi({}) as "{companyName}-Session-Api";
let sessionTable = new ports.SessionTable("sessions") as "{companyName}-Session-Table";

let basePath = "/sessions";

let createSessionHandler = new handlers.CreateSessionHandler({
  id: "createSessionHandler",
  table: sessionTable,
  region: AwsRegion,
}) as "{companyName}-CreateSessionFn";
let getSessionHandler = new handlers.GetSessionHandler({
  id: "getSessionHandler", 
  table: sessionTable,
  region: AwsRegion,
}) as "{companyName}-GetSessionFn";
let listSessionsHandler = new handlers.ListSessionsHandler({
  id: "listSessionsHandler",
  table: sessionTable,
  region: AwsRegion,
}) as "{companyName}-ListSessionsFn";
let updateSessionHandler = new handlers.UpdateSessionHandler({
  id: "updateSessionHandler",
  table: sessionTable,
  region: AwsRegion,
}) as "{companyName}-UpdateSessionFn";
let closeSessionHandler = new handlers.CloseSessionHandler({
  id: "closeSessionHandler",
  table: sessionTable,
  region: AwsRegion,
}) as "{companyName}-CloseSessionFn";

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
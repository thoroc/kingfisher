bring cloud;
bring expect;
bring http;
bring "../../libs/exceptions" as exceptions;
bring "../ports" as ports;
bring "./getSessionHandler.w" as sut;

let nilMockTable = new ports.MockSessionTable({}) as "NilSessionMockSessionTable";
let missingSessionIdHandler = new sut.GetSessionHandler({
  id: "nil-mock-table", 
  table: nilMockTable
}) as "MissingSessionIdGetSessionHandler";

test "Returns an error when the sessionId is missing" {
  let invalidSessionId = "invalid-session-id";
  let exception = new exceptions.BadRequestError("Missing required parameter sessionId");

  let result = missingSessionIdHandler.handle(cloud.ApiRequest {
    method: http.HttpMethod.GET,
    path: "/sessions/{invalidSessionId}",
    query: {},
    vars: {},
  });

  expect.equal(result.body, Json.stringify(exception.asErr()));
}

let invalidSessionIdHandler = new sut.GetSessionHandler({
    id: "nil-mock-table", 
  table: nilMockTable
}) as "InvalidSessionIdGetSessionHandler";

test "Returns an error when the sessionId is invalid" {
  let invalidSessionId = "invalid-session-id";
  let exception = new exceptions.NotFoundError("No record found for session with sessionId={invalidSessionId}");

  let result = invalidSessionIdHandler.handle(cloud.ApiRequest {
    method: http.HttpMethod.GET,
    path: "/sessions/{invalidSessionId}",
    query: {},
    vars: { sessionId: invalidSessionId },
  });

  expect.equal(result.body, Json.stringify(exception.asErr()));
}

let validMockTable = new ports.MockSessionTable({
  response: {
    sessionId: "valid-session-id",
    createdAt: "2021-01-01T00:00:00Z",
  }
}) as "ValidSessionIdMockSessionTable";
let validSessionIdHandler = new sut.GetSessionHandler({
  id: "nil-mock-table", 
  table: validMockTable
}) as "ValidSessionIdGetSessionHandler";

test "Returns a session from the table when the sessionId is valid" {
  let validSessionId = "valid-session-id";

  let result = validSessionIdHandler.handle(cloud.ApiRequest {
    method: http.HttpMethod.GET,
    path: "/sessions/{validSessionId}",
    query: {},
    vars: { sessionId: validSessionId },
  });

  expect.equal(result.body, Json.stringify({
    sessionId: "valid-session-id",
    createdAt: "2021-01-01T00:00:00Z",
  }));
}
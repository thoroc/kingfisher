bring cloud;
bring http;
bring expect;
bring "../exceptions" as exceptions;
bring "../mocks" as mocks;
bring "../ports" as ports;
bring "./getSessionHandler.w" as sut;

let erroMockTable = new mocks.MockTable(nil) as "ErroMockTable";
let errorHandler = new sut.GetSessionHandler({table: erroMockTable}) as "ErrorGetSessionHandler";

test "Returns an error when the session id is missing" {
  let invalidSessionId = "invalid-session-id";
  let exception = new exceptions.BadRequestError("Missing required parameter sessionId");

  let result = errorHandler.handle(cloud.ApiRequest {
    method: http.HttpMethod.GET,
    path: "/sessions/{invalidSessionId}",
    query: {},
    vars: {},
  });

  expect.equal(result.body, Json.stringify(exception.asErr()));
}

test "Returns an error when the session id is invalid" {
  let invalidSessionId = "invalid-session-id";
  let exception = new exceptions.NotFoundError("No record found for session with sessionId={invalidSessionId}");

  let result = errorHandler.handle(cloud.ApiRequest {
    method: http.HttpMethod.GET,
    path: "/sessions/{invalidSessionId}",
    query: {},
    vars: { sessionId: invalidSessionId },
  });

  expect.equal(result.body, Json.stringify(exception.asErr()));
}

let validMockTable = new mocks.MockTable(ports.SessionResponse {
  sessionId: "valid-session-id",
  createdAt: "2021-01-01T00:00:00Z",
}) as "ValidMockTable";

let validHandler = new sut.GetSessionHandler({table: validMockTable}) as "ValidGetSessionHandler";

test "Returns a session from the table when the session id is valid" {
  let validSessionId = "valid-session-id";

  let result = errorHandler.handle(cloud.ApiRequest {
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
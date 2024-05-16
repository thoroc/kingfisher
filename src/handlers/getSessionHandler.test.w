bring expect;
bring "../mocks" as mocks;
bring "../exceptions" as exceptions;
bring "./getSessionHandler.w" as sut;

let erroMockTable = new mocks.MockTable(nil) as "ErroMockTable";
let errorHandler = new sut.GetSessionHandler({table: erroMockTable}) as "ErrorGetSessionHandler";

test "Returns an error" {
  let invalidSessionId = "invalid session id";
  let exception = new exceptions.NotFoundError("No record found for session with sessionId={invalidSessionId}");

  let result = errorHandler.handle(invalidSessionId);

  expect.equal(result, Json.stringify(exception.asErr()));
}

let validMockTable = new mocks.MockTable({
  sessionId: "session id",
  createdAt: "2021-01-01T00:00:00Z",
}) as "ValidMockTable";
let validHandler = new sut.GetSessionHandler({table: validMockTable}) as "ValidGetSessionHandler";

test "Returns a session" {
  let validSessionId = "session id";

  let result = validHandler.handle(validSessionId);

  expect.equal(result, Json.stringify({
    sessionId: "session id",
    createdAt: "2021-01-01T00:00:00Z",
  }));
}
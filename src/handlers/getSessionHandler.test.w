bring expect;
bring "../mocks" as mocks;
bring "../exceptions" as exceptions;
bring "./getSessionHandler.w" as sut;

let erroMockTable = new mocks.MockTable(nil);
let handler = new sut.GetSessionHandler({table: erroMockTable});

test "Returns an error" {
  let invalidSessionId = "invalid session id";
  let exception = new exceptions.NotFoundError("No record found for session with sessionId={invalidSessionId}");

  let result = handler.handle(invalidSessionId);

  expect.equal(result, Json.stringify(exception.asErr()));
}
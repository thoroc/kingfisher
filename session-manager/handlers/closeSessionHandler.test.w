// bring cloud;
// bring expect;
// bring http;
// bring "./closeSessionHandler.w" as sut;
// bring "../mocks" as mocks;
// bring "../ports" as ports;

// let closedMockTable = new mocks.MockTable(ports.SessionResponse {
//   sessionId: "valid-session-id",
//   createdAt: "2021-01-01T00:00:00Z",
//   closedAt: "2021-01-01T00:00:00Z",
// });
// let closedSessionHandler = new sut.CloseSessionHandler({table: closedMockTable});

// test "Session is already closed" {
//   let validSessionId = "valid-session-id";

//   let result = closedSessionHandler.handle(cloud.ApiRequest {
//     path: "/sessions/{validSessionId}/close",
//     method: http.HttpMethod.POST,
//     query: {},
//     vars: { sessionId: validSessionId },
//   });
// }
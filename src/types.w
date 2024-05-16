bring dynamodb;
bring "./http" as http;
bring "./ports/ISessionTable.w" as sessionTable;
// bring "./exceptions" as exceptions;

pub struct Session {
  sessionId: str;
  createdAt: str;
  updatedAt: str?;
}

pub struct AwsConfig {
  region: str?;
}

// pub struct Address {
//   houseNumber: str;
//   street: str;
//   city: str;
//   postcode: str;
// }

// pub struct User {
//   firstName: str;
//   lastName: str;
//   email: str?;
//   phoneNumber: str?;
//   address: Address?;
// }

// pub struct SessionRequest {
//   sessionId: str;
//   user: User?;
// }

// pub struct SessionResponse extends SessionRequest {
//   createdAt: str;
//   updatedAt: str?;
//   closedAt: str?;
// }

pub struct SessionError {
  error: http.HttpStatus;
  message: str?;
}

// pub interface ISessionTable {
//   inflight closeSession(sessionId: str): SessionResponse?;
//   inflight createSession(): SessionResponse?;
//   inflight getSession(sessionId: str): SessionResponse?;
//   inflight updateSession(session: SessionRequest): SessionResponse?;
// }


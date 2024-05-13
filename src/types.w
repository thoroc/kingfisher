bring dynamodb;

pub struct Session {
  sessionId: str;
  createdAt: str;
  updatedAt: str?;
}

pub struct AwsConfig {
  region: str;
}

pub struct SessionRequest {
  sessionId: str;
}

pub struct SessionResponse extends SessionRequest {
  createdAt: str;
  updatedAt: str?;
}

pub interface ISessionTable {
  inflight createSession(): SessionResponse;
  inflight getSession(sessionId: str): SessionResponse;
  inflight updateSession(sessionId: str): SessionResponse;
}

pub struct SessionHandlerOptions extends AwsConfig {
  table: ISessionTable;
}

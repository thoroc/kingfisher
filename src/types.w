bring dynamodb;

pub struct Session {
  sessionId: str;
  createdAt: str;
  updatedAt: str?;
}

pub struct AwsConfig {
  region: str;
}

pub interface ISessionTable {
  inflight createSession(): Session;
  inflight getSession(sessionId: str): Session;
  inflight updateSession(sessionId: str): Session;
}

pub struct SessionHandlerOptions extends AwsConfig{
  table: ISessionTable;
}

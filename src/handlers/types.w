bring "../ports" as ports;

pub struct Session {
  sessionId: str;
  createdAt: str;
  updatedAt: str?;
}

pub struct AwsConfig {
  region: str?;
}


pub struct SessionHandlerOptions extends AwsConfig {
  table: ports.ISessionTable;
}

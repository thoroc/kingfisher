bring "../ports" as ports;

pub struct Session {
  sessionId: str;
  createdAt: str;
  updatedAt: str?;
}

pub struct AwsConfig {
  region: str?;
}


pub struct SessionHandlerProps extends AwsConfig {
  id: str;
  table: ports.ISessionTable;
}

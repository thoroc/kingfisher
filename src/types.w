bring dynamodb;

pub struct Session {
  sessionId: str;
  createdAt: str;
  updatedAt: str?;
}

pub struct AwsConfig {
  region: str;
}

pub struct SessionHandlerOptions extends AwsConfig{
  table: dynamodb.Table;
}
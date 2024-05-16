bring dynamodb;
bring "./http" as http;

pub struct Session {
  sessionId: str;
  createdAt: str;
  updatedAt: str?;
}

pub struct AwsConfig {
  region: str?;
}

pub struct SessionError {
  error: http.HttpStatus;
  message: str?;
}


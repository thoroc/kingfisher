bring "../ports" as ports;

pub struct AwsConfig {
  region: str?;
}

pub struct SessionHandlerProps extends AwsConfig {
  id: str;
  table: ports.ISessionTable;
}

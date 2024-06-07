bring "../core/user.w" as user;

pub struct SessionRequest {
  sessionId: str;
  user: user.User?;
}

pub struct SessionResponse extends SessionRequest {
  createdAt: str;
  updatedAt: str?;
  closedAt: str?;
}
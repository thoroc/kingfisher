bring "./user.w" as user;

pub struct Session {
  sessionId: str;
  createdAt: str;
  updatedAt: str?;
  user: user.User?;
}
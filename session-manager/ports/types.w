pub struct Address {
  houseNumber: str?;
  street: str?;
  city: str?;
  postcode: str?;
}

pub struct User {
  firstName: str?;
  lastName: str?;
  email: str?;
  phoneNumber: str?;
  address: Address?;
}

pub struct SessionRequest {
  sessionId: str;
  user: User?;
}

pub struct SessionResponse extends SessionRequest {
  createdAt: str;
  updatedAt: str?;
  closedAt: str?;
}
export type Address = {
  houseNumber: string;
  street: string;
  city: string;
  postcode: string;
};

export type User = {
  firstName: string;
  lastName: string;
  email: string;
  phoneNumber: string;
  address: Address;
};

export type Session = {
  sessionId: number;
  user?: User;
  createdAt: string;
  updatedAt?: string;
  closedAt?: string;
};

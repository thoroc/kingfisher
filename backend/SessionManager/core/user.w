bring "./address.w" as address;
// bring "./utils.w" as utils;

pub struct User {
  firstName: str?;
  lastName: str?;
  email: str?;
  phoneNumber: str?;
  address: address.Address?;
}

  // pub inflight merge(otherUser: User): User {
  //   let props = utils.ClassUtils.mergeJson(this.toJson(), otherUser.toJson());

  //   return User.fromJson(props);
  // }

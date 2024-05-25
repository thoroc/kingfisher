import { EditText } from 'react-edit-text';
import { User } from '../../models/Session';
import { AddressEdit } from './AddressEdit';

export const UserEdit: React.FC<User> = (user) => {
  return (
    <>
      <div style={{ display: 'flex' }}>
        <label className="mr-2">First name</label>
        <EditText name="first name" default={user.firstName} inline />
      </div>
      <div style={{ display: 'flex' }}>
        <label className="mr-2">Last name</label>
        <EditText name="last name" default={user.lastName} inline />
      </div>
      <div style={{ display: 'flex' }}>
        <label className="mr-2">Email</label>
        <EditText name="email" default={user.email} inline />
      </div>
      <div style={{ display: 'flex' }}>
        <label className="mr-2">Phone number</label>
        <EditText name="phone number" default={user.phoneNumber} inline />
      </div>
      <AddressEdit {...user.address} />
    </>
  );
};

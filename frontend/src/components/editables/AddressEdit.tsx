import { EditText } from 'react-edit-text';
import { Address } from '../../models/Session';

export const AddressEdit: React.FC<Address> = (address) => {
  return (
    <>
      <div style={{ display: 'flex' }}>
        <label className="mr-2">House number</label>
        <EditText name="house number" default={address.houseNumber} inline />
      </div>
      <div style={{ display: 'flex' }}>
        <label className="mr-2">Street</label>
        <EditText name="street" default={address.street} inline />
      </div>
      <div style={{ display: 'flex' }}>
        <label className="mr-2">City</label>
        <EditText name="city" default={address.city} inline />
      </div>
      <div style={{ display: 'flex' }}>
        <label className="mr-2">Postcode</label>
        <EditText name="postcode" default={address.postcode} inline />
      </div>
    </>
  );
};

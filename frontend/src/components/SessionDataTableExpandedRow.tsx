import { EditText } from 'react-edit-text';
import 'react-edit-text/dist/index.css';

import { Session } from '../models/Session';

export interface SessionDataTableExpandedRowProps {
  data: Session;
}

export const SessionDataTableExpandedRow: React.FC<
  SessionDataTableExpandedRowProps
> = (props) => {
  return (
    <>
      <div>
        <div>
          <div style={{ display: 'flex' }}>
            <label className="mr-2">First name</label>
            <EditText
              name="first name"
              default={props.data.user?.firstName}
              inline
            />
          </div>
          <div style={{ display: 'flex' }}>
            <label className="mr-2">Last name</label>
            <EditText
              name="last name"
              default={props.data.user?.lastName}
              inline
            />
          </div>
          <div style={{ display: 'flex' }}>
            <label className="mr-2">Email</label>
            <EditText name="email" default={props.data.user?.email} inline />
          </div>
          <div style={{ display: 'flex' }}>
            <label className="mr-2">Phone number</label>
            <EditText
              name="phone number"
              default={props.data.user?.phoneNumber}
              inline
            />
          </div>
          <div style={{ display: 'flex' }}>
            <label className="mr-2">House number</label>
            <EditText
              name="house number"
              default={props.data.user?.address.houseNumber}
              inline
            />
          </div>
          <div style={{ display: 'flex' }}>
            <label className="mr-2">Street</label>
            <EditText
              name="street"
              default={props.data.user?.address.street}
              inline
            />
          </div>
          <div style={{ display: 'flex' }}>
            <label className="mr-2">City</label>
            <EditText
              name="city"
              default={props.data.user?.address.city}
              inline
            />
          </div>
          <div style={{ display: 'flex' }}>
            <label className="mr-2">Postcode</label>
            <EditText
              name="postcode"
              default={props.data.user?.address.postcode}
              inline
            />
          </div>
        </div>
      </div>
    </>
  );
};

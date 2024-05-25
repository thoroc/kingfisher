import { EditText } from 'react-edit-text';
import 'react-edit-text/dist/index.css';

import { Session, User } from '../models/Session';
import { updateSession } from '../services/SessionApi';

export interface SessionDataTableExpandedRowProps {
  data: Session;
}

export const SessionDataTableExpandedRow: React.FC<
  SessionDataTableExpandedRowProps
> = (props) => {
  const handleSave = ({
    name,
    value,
    previousValue,
  }: {
    name: string;
    value: string;
    previousValue: string;
  }): void => {
    console.log(`SessionId: ${props.data.sessionId}`);
    console.log(`Saved ${name}: ${value}, was ${previousValue}`);

    // update the session data
    const user: User = { ...props.data.user, [name]: value };
    console.log(user);
    updateSession(props.data.sessionId, user)
      .then((session) => {
        console.log('Updated session:', session);
        console.log(session);
      })
      .catch((error) => {
        console.error('General error:', error.message);
        console.error(JSON.stringify(error));
      });
  };

  return (
    <>
      <div>
        <div>
          <div style={{ display: 'flex' }}>
            <label className="mr-2">First name</label>
            <EditText
              name="firstName"
              default={props.data.user?.firstName}
              inline
              onSave={handleSave}
            />
          </div>
          <div style={{ display: 'flex' }}>
            <label className="mr-2">Last name</label>
            <EditText
              name="lastName"
              default={props.data.user?.lastName}
              inline
              onSave={handleSave}
            />
          </div>
          <div style={{ display: 'flex' }}>
            <label className="mr-2">Email</label>
            <EditText
              name="email"
              default={props.data.user?.email}
              inline
              onSave={handleSave}
            />
          </div>
          <div style={{ display: 'flex' }}>
            <label className="mr-2">Phone number</label>
            <EditText
              name="phoneNumber"
              default={props.data.user?.phoneNumber}
              inline
              onSave={handleSave}
            />
          </div>
          <div style={{ display: 'flex' }}>
            <label className="mr-2">House number</label>
            <EditText
              name="houseNumber"
              default={props.data.user?.address?.houseNumber}
              inline
              onSave={handleSave}
            />
          </div>
          <div style={{ display: 'flex' }}>
            <label className="mr-2">Street</label>
            <EditText
              name="street"
              default={props.data.user?.address?.street}
              inline
              onSave={handleSave}
            />
          </div>
          <div style={{ display: 'flex' }}>
            <label className="mr-2">City</label>
            <EditText
              name="city"
              default={props.data.user?.address?.city}
              inline
              onSave={handleSave}
            />
          </div>
          <div style={{ display: 'flex' }}>
            <label className="mr-2">Postcode</label>
            <EditText
              name="postcode"
              default={props.data.user?.address?.postcode}
              inline
              onSave={handleSave}
            />
          </div>
        </div>
      </div>
    </>
  );
};

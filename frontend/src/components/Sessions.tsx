import React from 'react';
import DataTable from 'react-data-table-component';
import { Session } from '../models/Session';

export interface SessionsProps {
  data: Session[];
}

export const Sessions: React.FC<SessionsProps> = (props) => {
  const columns = [
    {
      name: 'SessionId',
      selector: (row: Session) => row.sessionId,
    },
    {
      name: 'FirstName',
      selector: (row: Session) => row.user?.firstName || '',
    },
    {
      name: 'LastName',
      selector: (row: Session) => row.user?.lastName || '',
    },
    { name: 'Email', selector: (row: Session) => row.user?.email || '' },
    {
      name: 'PhoneNumber',
      selector: (row: Session) => row.user?.phoneNumber || '',
    },
    {
      name: 'HouseNumber',
      selector: (row: Session) => row.user?.address.houseNumber || '',
    },
    {
      name: 'Street',
      selector: (row: Session) => row.user?.address.street || '',
    },
    { name: 'City', selector: (row: Session) => row.user?.address.city || '' },
    {
      name: 'Postcode',
      selector: (row: Session) => row.user?.address.postcode || '',
    },
    { name: 'CreatedAt', selector: (row: Session) => row.createdAt.toString() },
    {
      name: 'UpdatedAt',
      selector: (row: Session) => row.updatedAt?.toString() || '',
    },
    {
      name: 'ClosedAt',
      selector: (row: Session) => row.closedAt?.toString() || '',
    },
  ];

  return (
    <>
      <div>
        <h1>Sessions</h1>
        <DataTable columns={columns} data={props.data} />
      </div>
    </>
  );
};

import React from 'react';
import DataTable from 'react-data-table-component';
import { Session } from '../models/Session';
import { SessionDataTableExpandedRow } from './SessionDataTableExpandedRow';

export interface SessionDataTableProps {
  data: Session[];
}

export const SessionDataTable: React.FC<SessionDataTableProps> = (props) => {
  const columns = [
    {
      name: 'SessionId',
      selector: (row: Session) => row.sessionId,
    },
    {
      name: 'CreatedAt',
      selector: (row: Session) => row.createdAt.toString(),
    },
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
        <DataTable
          columns={columns}
          data={props.data}
          expandableRows
          expandOnRowClicked
          expandableRowsComponent={SessionDataTableExpandedRow}
        />
      </div>
    </>
  );
};

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
      sortable: true,
    },
    {
      name: 'CreatedAt',
      selector: (row: Session) => row.createdAt.toString(),
      sortable: true,
    },
    {
      name: 'UpdatedAt',
      selector: (row: Session) => row.updatedAt?.toString() || '',
      sortable: true,
    },
    {
      name: 'ClosedAt',
      selector: (row: Session) => row.closedAt?.toString() || '',
      sortable: true,
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

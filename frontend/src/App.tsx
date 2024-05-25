import React, { useEffect } from 'react';
import './App.css';
import '../.winglibs/wing-env.d.ts';
import { SessionDataTable } from './components/SessionDataTable.tsx';
import { Session } from './models/Session.ts';
import { createSession, listSessions } from './services/SessionApi.ts';

export const App: React.FC = () => {
  const API_URL = window.wing.env.API_URL;

  const [sessionId, setSessionId] = React.useState<string>('');
  const [sessions, setSessions] = React.useState<Session[]>([]);

  const createSessionHandler = async () => {
    try {
      const session = await createSession();
      if (session !== undefined) {
        setSessionId(session.sessionId);
        setSessions([...sessions, session]);
      }
    } catch (error: any) {
      console.error('General error:', error.message);
    }
  };

  useEffect(() => {
    listSessions().then((sessions) => {
      setSessions(sessions);
    });
    // fetch the sessions data from the API
    // set the sessions data to the state
  }, []);

  return (
    <>
      <h1>{window.wing.env.TITLE}</h1>
      <div className="App">
        <div>{API_URL}</div>
        <button onClick={createSessionHandler}>Create Session</button>

        {/* pass the sessions data to the Sessions component */}
        <SessionDataTable data={sessions} />
      </div>
    </>
  );
};

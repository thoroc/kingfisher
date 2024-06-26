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
        if (sessions === undefined) {
          setSessions([session]);
        } else {
          setSessions([...sessions, session]);
        }
      }
    } catch (error: any) {
      console.error('General error:', error.message);
    }
  };

  useEffect(() => {
    listSessions().then((sessions) => {
      setSessions(sessions || []);
    });
    // TODO : figure out why we have 2 calls on load
    // TODO : figure out how to load the data on the first call
  }, []);

  return (
    <>
      <h1>{window.wing.env.TITLE}</h1>
      <div className="App">
        <div>{API_URL}</div>
        <button onClick={createSessionHandler}>Create Session</button>

        <SessionDataTable data={sessions} />
      </div>
    </>
  );
};

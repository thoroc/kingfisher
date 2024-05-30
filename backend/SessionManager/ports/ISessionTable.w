bring "./types.w" as types;


pub interface ISessionTable {
  inflight getTableName(): str;
  inflight closeSession(sessionId: str): types.SessionResponse?;
  inflight createSession(): types.SessionResponse?;
  inflight getSession(sessionId: str): types.SessionResponse?;
  inflight listSessions(): Array<types.SessionResponse>;
  inflight updateSession(session: types.SessionRequest): types.SessionResponse?;
}
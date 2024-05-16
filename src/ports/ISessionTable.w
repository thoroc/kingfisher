bring "./types.w" as types;


pub interface ISessionTable {
  inflight closeSession(sessionId: str): types.SessionResponse?;
  inflight createSession(): types.SessionResponse?;
  inflight getSession(sessionId: str): types.SessionResponse?;
  inflight updateSession(session: types.SessionRequest): types.SessionResponse?;
}
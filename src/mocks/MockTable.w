bring "../types.w" as types;

pub class MockTable impl types.ISessionTable {
  _response: types.SessionResponse?;

  new(response: types.SessionResponse?) {
    this._response = response;
  }

  pub inflight closeSession(sessionId: str): types.SessionResponse? {
    return this._response;
  }
  pub inflight createSession(): types.SessionResponse? {
    return this._response;
  }
  pub inflight getSession(sessionId: str): types.SessionResponse? {
    return this._response;
  }
  pub inflight updateSession(session: types.SessionRequest): types.SessionResponse? {
    return this._response;
  }
}
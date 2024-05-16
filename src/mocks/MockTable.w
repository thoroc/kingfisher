bring "../ports" as ports;

pub class MockTable impl ports.ISessionTable {
  _response: ports.SessionResponse?;

  new(response: ports.SessionResponse?) {
    this._response = response;
  }

  pub inflight closeSession(sessionId: str): ports.SessionResponse? {
    return this._response;
  }
  pub inflight createSession(): ports.SessionResponse? {
    return this._response;
  }
  pub inflight getSession(sessionId: str): ports.SessionResponse? {
    return this._response;
  }
  pub inflight updateSession(session: ports.SessionRequest): ports.SessionResponse? {
    return this._response;
  }
}
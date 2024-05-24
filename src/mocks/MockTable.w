bring "../ports" as ports;

pub class MockTable impl ports.ISessionTable {
  _response: ports.SessionResponse?;

  new(response: ports.SessionResponse?) {
    this._response = response;
  }

  pub inflight closeSession(sessionId: str): ports.SessionResponse? {
    log("> closeSession: {sessionId}");
    log("response: {Json.stringify(this._response)}");
    return this._response;
  }
  pub inflight createSession(): ports.SessionResponse? {
    log("> createSession");
    log("response: {Json.stringify(this._response)}");
    return this._response;
  }
  pub inflight getSession(sessionId: str): ports.SessionResponse? {
    log("> getSession: {sessionId}");
    log("response: {Json.stringify(this._response)}");
    return this._response;
  }
  pub inflight updateSession(session: ports.SessionRequest): ports.SessionResponse? {
    log("> updateSession");
    log("response: {Json.stringify(this._response)}");
    return this._response;
  }
}
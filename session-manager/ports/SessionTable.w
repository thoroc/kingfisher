bring dynamodb;
bring util;
bring "./types.w" as types;
bring "./ISessionTable.w" as ISessionTable;


pub class SessionTable impl ISessionTable.ISessionTable {
  _table: dynamodb.Table;

  new(tableName: str) {
    this._table = new dynamodb.Table(
      name: tableName,
      attributes: [
        {
          name: "sessionId",
          type: "S"
        },
      ],
      hashKey: "sessionId",
    );
  }


  pub inflight closeSession(sessionId: str): types.SessionResponse? {
    let currSession = this.getSession(sessionId);

    if (currSession == nil) {
      return nil;
    }

    let closedSession: types.SessionResponse = {
      closedAt: std.Datetime.utcNow().toIso(),
      createdAt: currSession!.createdAt,
      sessionId: sessionId,
      updatedAt: std.Datetime.utcNow().toIso(),
      user: currSession!.user,
    };

    this._table.put(
      Item: closedSession
    );

    return closedSession;
  }

  pub inflight createSession(): types.SessionResponse? {
    let sessionId = util.uuidv4();
    let createdAt = std.Datetime.utcNow().toIso();

    let session: types.SessionResponse = {
      createdAt: createdAt,
      sessionId: sessionId,
    };

    this._table.put(
      Item: session
    );

    return session;
  }

  pub inflight getSession(sessionId: str): types.SessionResponse? {
    let response = this._table.get(
      Key: {
        sessionId: sessionId
      }
    );

    if (response.Item == nil) {
      throw("error: No record for sessionId={sessionId}");
      return nil;
    }

    return types.SessionResponse.fromJson(response.Item);
  }

  pub inflight listSessions(): Array<types.SessionResponse> {
    let response = this._table.scan();

    if (response.Items.length == 0) {
      return [];
    }

    let data = MutArray<types.SessionResponse>[];

    for item in response.Items {
      data.push(types.SessionResponse.fromJson(item));
    }

    return data.copy();
  }

  pub inflight updateSession(session: types.SessionRequest): types.SessionResponse? {

    let currSession = this.getSession(session.sessionId);

    if (currSession == nil) {
      log("No session found for sessionId={session.sessionId}");
      return nil;
    }

    log("Updating session: {session.sessionId}");

    let updatedSession: types.SessionResponse = {
      createdAt: currSession!.createdAt,
      sessionId: session.sessionId,
      updatedAt: std.Datetime.utcNow().toIso(),
      user: session.user,
    };

    this._table.put(
      Item: updatedSession
    );

    return updatedSession;
  }
}

pub class MockSessionTable impl ISessionTable.ISessionTable {
  _response: types.SessionResponse?;

  new(response: types.SessionResponse?) {
    this._response = response;
  }

  pub inflight closeSession(sessionId: str): types.SessionResponse? {
    log("> closeSession: {sessionId}");
    log("response: {Json.stringify(this._response)}");
    return this._response;
  }

  pub inflight createSession(): types.SessionResponse? {
    log("> createSession");
    log("response: {Json.stringify(this._response)}");
    return this._response;
  }

  pub inflight getSession(sessionId: str): types.SessionResponse? {
    log("> getSession: {sessionId}");
    log("response: {Json.stringify(this._response)}");
    return this._response;
  }

  pub inflight listSessions(): Array<types.SessionResponse> {
    log("> listSessions");
    log("response: {Json.stringify(this._response)}");

    let response = MutArray<types.SessionResponse>();

    if (this._response != nil) {
      response.push(this._response);
    }

    return response.copy();
  }

  pub inflight updateSession(session: types.SessionRequest): types.SessionResponse? {
    log("> updateSession");
    log("response: {Json.stringify(this._response)}");
    return this._response;
  }
}
bring dynamodb;
bring util;
bring "./types.w" as types;
bring "./ISessionTable.w" as ISessionTable;


pub class SessionTable impl ISessionTable.ISessionTable {
  _name: str;
  _table: dynamodb.ITable;

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
    this._name = tableName;
  }

  pub inflight getTableName(): str {
    return this._name;
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

    let sessions = MutArray<types.SessionResponse>[];

    if (response.Items.length == 0) {
      return sessions.copy();
    }

    for item in response.Items {
      sessions.push(types.SessionResponse.fromJson(item));
    }

    return sessions.copy();
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

pub struct MockSessionTableProps {
  name: str?;
  response: types.SessionResponse?;
}

pub class MockSessionTable impl ISessionTable.ISessionTable {
  _name: str;
  _response: types.SessionResponse?;

  new(props: MockSessionTableProps) {
    this._name = props.name ?? "MockTable";
    this._response = props.response;
  }

  pub inflight getTableName(): str {
    return this._name;
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
    log("response props: {Json.stringify(this._response)}");

    let response = MutArray<types.SessionResponse>[];

    log("response new: {Json.stringify(response)}");

    // if (this._response != nil) {
    //   response.push(this._response!);
    // }

    return response.copy();
  }

  pub inflight updateSession(session: types.SessionRequest): types.SessionResponse? {
    log("> updateSession");
    log("response: {Json.stringify(this._response)}");
    return this._response;
  }
}
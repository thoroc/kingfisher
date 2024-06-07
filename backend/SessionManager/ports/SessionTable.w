bring dynamodb;
bring util;
bring "./types.w" as types;
bring "./ISessionTable.w" as ISessionTable;
bring "../core" as core;


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
    log("SessionTable - updateSession: {session.sessionId}");

    let currSession: types.SessionResponse? = this.getSession(session.sessionId);

    log("SessionTable - currSession: {Json.stringify(currSession)}");

    if (currSession == nil) {
      log("SessionTable - No session found for sessionId={session.sessionId}");
      return nil;
    }

    let currUser = currSession!.user ?? {};
    let reqUser = session.user ?? {};
    let updatedUser = core.CoreUtils.mergeJson(currUser, reqUser);

    log("SessionTable - Updating session: {session.sessionId}");

    try {
      log("SessionTable - updatedUser: {Json.stringify(updatedUser)}");

      let updatedSession: types.SessionResponse = {
        createdAt: currSession!.createdAt,
        sessionId: session.sessionId,
        updatedAt: std.Datetime.utcNow().toIso(),
        user: core.User.fromJson(updatedUser),
      };

      this._table.put(
        Item: updatedSession
      );

      return updatedSession;
    } catch error {
      log("SessionTable - Error: {error}");
      throw("Error: {error}");
    }
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
    log("MockSessionTable - closeSession: {sessionId}");
    log("MockSessionTable - response: {Json.stringify(this._response)}");
    return this._response;
  }

  pub inflight createSession(): types.SessionResponse? {
    log("MockSessionTable - createSession");
    log("MockSessionTable - response: {Json.stringify(this._response)}");
    return this._response;
  }

  pub inflight getSession(sessionId: str): types.SessionResponse? {
    log("MockSessionTable - getSession: {sessionId}");
    log("MockSessionTable - response: {Json.stringify(this._response)}");
    return this._response;
  }

  pub inflight listSessions(): Array<types.SessionResponse> {
    log("MockSessionTable - listSessions");
    log("MockSessionTable - response props: {Json.stringify(this._response)}");

    let response = MutArray<types.SessionResponse>[];

    log("MockSessionTable - response new: {Json.stringify(response)}");

    // if (this._response != nil) {
    //   response.push(this._response!);
    // }

    return response.copy();
  }

  pub inflight updateSession(session: types.SessionRequest): types.SessionResponse? {
    log("MockSessionTable - updateSession");
    log("MockSessionTable - response: {Json.stringify(this._response)}");
    return this._response;
  }
}
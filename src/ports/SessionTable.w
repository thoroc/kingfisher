bring dynamodb;
bring util;
bring "../types.w" as types;

pub class SessionTable impl types.ISessionTable{
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

  pub inflight getSession(sessionId: str): types.SessionResponse {
    let response = this._table.get(
      Key: {
        sessionId: sessionId
      }
    );

    if (response.Item == nil) {
      throw("error: No record for sessionId={sessionId}");
    }

    return types.SessionResponse.fromJson(response.Item);
  }

  pub inflight updateSession(session: types.SessionRequest): types.SessionResponse {

    let currSession = this.getSession(session.sessionId);

    // TODO: find a way to update the fields from currSession with session

    let updatedSession: types.SessionResponse = {
      sessionId: session.sessionId,
      createdAt: currSession.createdAt,
      updatedAt: std.Datetime.utcNow().toIso(),
      user: session.user,
    };

    this._table.put(
      Item: updatedSession
    );

    return updatedSession;
  }

  pub inflight createSession(): types.SessionResponse {
    let sessionId = util.uuidv4();
    let createdAt = std.Datetime.utcNow().toIso();

    let session: types.SessionResponse = {
      sessionId: sessionId,
      createdAt: createdAt,
    };

    this._table.put(
      Item: session
    );

    return session;
  }

  pub inflight closeSession(sessionId: str): types.SessionResponse {
    let session = this.getSession(sessionId);

    this._table.put(
      Item: {
        sessionId: sessionId,
        createdAt: session.createdAt,
        updatedAt: std.Datetime.utcNow().toIso(),
        closedAt: std.Datetime.utcNow().toIso(),
      }
    );

    return session;
  }
}
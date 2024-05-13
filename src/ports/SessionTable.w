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

  pub inflight getSession(sessionId: str): types.Session {
    let response = this._table.get(
      Key: {
        sessionId: sessionId
      }
    );

    if (response.Item == nil) {
      throw("error: No record for sessionId={sessionId}");
    }

    return types.Session.fromJson(response.Item);
  }

  pub inflight updateSession(sessionId: str): types.Session {

    let currSession = this.getSession(sessionId);

    let updatedSession: types.Session = {
      sessionId: sessionId,
      createdAt: currSession.createdAt,
      updatedAt: std.Datetime.utcNow().toIso(),
    };

    this._table.put(
      Item: updatedSession
    );

    return updatedSession;
  }

  pub inflight createSession(): types.Session {
    let sessionId = util.uuidv4();
    let createdAt = std.Datetime.utcNow().toIso();

    let session = {
      sessionId: sessionId,
      createdAt: createdAt,
    };

    this._table.put(
      Item: session
    );

    return session;
  }
}
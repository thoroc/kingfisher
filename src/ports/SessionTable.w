bring dynamodb;
bring util;
bring "../types.w" as types;

pub struct Address {
  houseNumber: str;
  street: str;
  city: str;
  postcode: str;
}

pub struct User {
  firstName: str;
  lastName: str;
  email: str?;
  phoneNumber: str?;
  address: Address?;
}

pub struct SessionRequest {
  sessionId: str;
  user: User?;
}

pub struct SessionResponse extends SessionRequest {
  createdAt: str;
  updatedAt: str?;
  closedAt: str?;
}

pub interface ISessionTable {
  inflight closeSession(sessionId: str): SessionResponse?;
  inflight createSession(): SessionResponse?;
  inflight getSession(sessionId: str): SessionResponse?;
  inflight updateSession(session: SessionRequest): SessionResponse?;
}

pub class SessionTable impl ISessionTable {
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

  pub inflight getSession(sessionId: str): SessionResponse? {
    let response = this._table.get(
      Key: {
        sessionId: sessionId
      }
    );

    if (response.Item == nil) {
      throw("error: No record for sessionId={sessionId}");
      return nil;
    }

    return SessionResponse.fromJson(response.Item);
  }

  pub inflight updateSession(session: SessionRequest): SessionResponse? {

    let currSession = this.getSession(session.sessionId);

    if (currSession == nil) {
      return nil;
    }

    let updatedSession: SessionResponse = {
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

  pub inflight createSession(): SessionResponse? {
    let sessionId = util.uuidv4();
    let createdAt = std.Datetime.utcNow().toIso();

    let session: SessionResponse = {
      createdAt: createdAt,
      sessionId: sessionId,
    };

    this._table.put(
      Item: session
    );

    return session;
  }

  pub inflight closeSession(sessionId: str): SessionResponse? {
    let currSession = this.getSession(sessionId);

    if (currSession == nil) {
      return nil;
    }

    let closedSession: SessionResponse = {
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
}
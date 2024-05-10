bring cloud;
bring dynamodb;
bring util;
bring "../types.w" as types;


pub class PostSessionHandler impl cloud.IFunctionHandler {
  _table: dynamodb.Table;

  new(table: dynamodb.Table) {
    this._table = table;
  }

  pub inflight handle(event: str?): str? {
    let sessionId = util.uuidv4();
    log("Creating new session with sessionId={sessionId}");

    let data = types.Session {
      sessionId: sessionId, 
      createdAt: std.Datetime.utcNow().toIso()
    };

    this._table.put(
      Item: data
    );

    return sessionId;
  }
}

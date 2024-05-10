bring cloud;
bring ex;
bring util;
bring "../types.w" as types;


pub class PostSessionHandler impl cloud.IFunctionHandler {
  _table: ex.Table;

  new(table: ex.Table) {
    this._table = table;
  }

  pub inflight handle(event: str?): str? {
    let sessionId = util.uuidv4();
    log("Hello {sessionId} from the PostSessionHandler");

    let data = types.Session {
      sessionId: sessionId, 
      createdAt: std.Datetime.utcNow().toIso()
    };

    this._table.insert(sessionId, Json.stringify(data));

    return sessionId;
  }
}

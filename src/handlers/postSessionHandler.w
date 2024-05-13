bring cloud;
bring dynamodb;
bring util;
bring "../types.w" as types;


pub class PostSessionHandler impl cloud.IFunctionHandler {
  _table: types.ISessionTable;

  new(options: types.SessionHandlerOptions) {
    this._table = options.table;
  }

  pub inflight handle(event: str?): str? {
    let sessionId = util.uuidv4();

    log("Creating new session with sessionId={sessionId}");

    let session = this._table.createSession();

    return Json.stringify(session);
  }
}

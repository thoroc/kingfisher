bring cloud;
bring "../types.w" as types;


pub class PostSessionHandler impl cloud.IFunctionHandler {
  _table: types.ISessionTable;

  new(options: types.SessionHandlerOptions) {
    this._table = options.table;
  }

  pub inflight handle(event: str?): str? {
    let session: types.SessionResponse = this._table.createSession();

    log("Created new session with sessionId={session.sessionId}");

    return Json.stringify(session);
  }
}

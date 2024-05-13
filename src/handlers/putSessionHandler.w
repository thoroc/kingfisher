bring cloud;
bring "../types.w" as types;

pub class PutSessionHandler impl cloud.IFunctionHandler {
  _table: types.ISessionTable;

  new(options: types.SessionHandlerOptions) {
    this._table = options.table;
  }

  pub inflight handle(sessionId: str?): str? {
    let session: types.SessionResponse = this._table.updateSession(sessionId!);

    log("Updated session with sessionId={session.sessionId}");

    return Json.stringify(session);
  }
}

bring cloud;
bring dynamodb;
bring "../types.w" as types;

pub class PutSessionHandler impl cloud.IFunctionHandler {
  _table: types.ISessionTable;

  new(options: types.SessionHandlerOptions) {
    this._table = options.table;
  }

  pub inflight handle(sessionId: str?): str? {
    log("Updating session with sessionId={sessionId!}");

    let session = this._table.updateSession(sessionId!);

    return Json.stringify(session);
  }
}

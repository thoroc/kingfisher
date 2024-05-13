bring cloud;
bring dynamodb;
bring "../types.w" as types;

pub class GetSessionHandler impl cloud.IFunctionHandler {
  _table: types.ISessionTable;

  new(options: types.SessionHandlerOptions) {
    this._table = options.table;
  }

  pub inflight handle(sessionId: str?): str? {
    log("Getting record for session with sessionId={sessionId!}");

    let session = this._table.getSession(sessionId!);

    return Json.stringify(session);
  }
}

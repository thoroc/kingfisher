bring cloud;
bring "../types.w" as types;

pub class GetSessionHandler impl cloud.IFunctionHandler {
  _table: types.ISessionTable;

  new(options: types.SessionHandlerOptions) {
    this._table = options.table;
  }

  pub inflight handle(sessionId: str?): str? {
    let session = this._table.getSession(sessionId!);

    if (session == nil) {
      log("No record found for session with sessionId={sessionId!}");
      return nil;
    }

    log("Fetched record for session with sessionId={session!.sessionId}");

    return Json.stringify(session);
  }
}

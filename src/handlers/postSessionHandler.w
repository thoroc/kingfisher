bring cloud;
bring "../types.w" as types;


pub class PostSessionHandler impl cloud.IFunctionHandler {
  _table: types.ISessionTable;

  new(options: types.SessionHandlerOptions) {
    this._table = options.table;
  }

  pub inflight handle(event: str?): str? {
    let session = this._table.createSession();

    if (session == nil) {
      log("Failed to create new session");
      return nil;
    }

    log("Created new session with sessionId={session!.sessionId}");

    return Json.stringify(session);
  }
}

bring cloud;
bring "../types.w" as types;
bring "../exceptions" as exceptions;


pub class CreateSessionHandler impl cloud.IFunctionHandler {
  _table: types.ISessionTable;

  new(options: types.SessionHandlerOptions) {
    this._table = options.table;
  }

  pub inflight handle(event: str?): str? {
    let session = this._table.createSession();

    if (session == nil) {
      let message = "Failed to create new session";
      let exceptions = new exceptions.InternalServerError(message);

      log(message);

      return Json.stringify(exceptions.asErr());
    }

    log("Created new session with sessionId={session!.sessionId}");

    return Json.stringify(session);
  }
}

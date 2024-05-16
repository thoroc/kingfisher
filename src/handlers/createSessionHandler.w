bring cloud;
bring "../types.w" as types;
bring "../exceptions" as exceptions;
bring "../ports" as ports;
bring "./defaultSessionHandler.w" as options;


pub class CreateSessionHandler impl cloud.IFunctionHandler {
  _table: ports.ISessionTable;

  new(options: options.SessionHandlerOptions) {
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

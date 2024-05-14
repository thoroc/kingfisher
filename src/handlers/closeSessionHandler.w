bring cloud;
bring "../types.w" as types;
bring "../exceptions" as exceptions;

pub class CloseSessionHandler impl cloud.IFunctionHandler {
  _table: types.ISessionTable;

  new(options: types.SessionHandlerOptions) {
    this._table = options.table;
  }

  pub inflight handle(event: str?): str? {
    log("Event={event!}");

    if let sessionJson = Json.tryParse(event!) {
      let sessionRequest = types.SessionRequest.tryFromJson(sessionJson);

      if (sessionRequest == nil) {
        let exception = new exceptions.BadRequestError();

        return Json.stringify(exception.asErr());
      }

      log("SessionRequest={Json.stringify(sessionRequest!)}");

      let session = this._table.closeSession(sessionRequest?.sessionId!);

      if (session == nil) {
        let message = "Failed to update session";
        let exception = new exceptions.InternalServerError(message);

        log(message);

        return Json.stringify(exception.asErr());
      }

      log("Session={Json.stringify(session!)}");

      if (session?.closedAt != nil) {
        let message = "Session already closed";
        let exception = new exceptions.BadRequestError(message);

        log(message);

        return Json.stringify(exception.asErr());
      }

      log("Updated session with sessionId={session!.sessionId}");

      return Json.stringify(session);
    }

    let message = "Failed to parse event";
    let exception = new exceptions.BadRequestError(message);

    log(message);

    return Json.stringify(exception.asErr());
  }
}

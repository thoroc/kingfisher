bring cloud;
bring "../types.w" as types;

pub class PutSessionHandler impl cloud.IFunctionHandler {
  _table: types.ISessionTable;

  new(options: types.SessionHandlerOptions) {
    this._table = options.table;
  }

  pub inflight handle(event: str?): str? {
    log("Event={event!}");

    if let sessionJson = Json.tryParse(event!) {
      let sessionRequest = types.SessionRequest.tryFromJson(sessionJson);

      if (sessionRequest == nil) {
        log("Invalid request");
        return nil;
      }

      log("SessionRequest={Json.stringify(sessionRequest!)}");

      let session = this._table.updateSession(sessionRequest!);

      if (session == nil) {
        log("Failed to update session");
        return nil;
      }

      log("Updated session with sessionId={session!.sessionId}");

      return Json.stringify(session);
    }
  }
}

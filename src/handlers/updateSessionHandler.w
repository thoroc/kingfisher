bring cloud;
bring "../types.w" as types;
bring "../exceptions" as exceptions;
bring "../ports" as ports;
bring "./defaultSessionHandler.w" as options;

pub class UpdateSessionHandler impl cloud.IApiEndpointHandler {
  _table: ports.ISessionTable;

  new(options: options.SessionHandlerOptions) {
    this._table = options.table;
  }

  pub inflight handle(request: cloud.ApiRequest): cloud.ApiResponse {
    let sessionId = request.vars.get("sessionId");

    if let sessionJson = Json.tryParse(request.body!) {
      let sessionRequest = ports.SessionRequest.tryFromJson(sessionJson);

      if (sessionRequest == nil) {
        let exception = new exceptions.BadRequestError();

        log(exception.status.message);

        return {
          status: exception.status.code,
          headers: { "Content-Type": "application/json" },
          body: Json.stringify(exception.asErr())
        };
      }

      log("SessionRequest={Json.stringify(sessionRequest!)}");

      let session = this._table.updateSession(sessionRequest!);

      if (session == nil) {
        let message = "Failed to update session";
        let exception = new exceptions.InternalServerError(message);

        log(message);

        return {
          status: exception.status.code,
          headers: { "Content-Type": "application/json" },
          body: Json.stringify(exception.asErr())
        };
      }

      if (session?.closedAt != nil) {
        let message = "Session already closed";
        let exception = new exceptions.BadRequestError(message);

        log(message);

        return {
          status: exception.status.code,
          headers: { "Content-Type": "application/json" },
          body: Json.stringify(exception.asErr())
        };
      }

      log("Updated session with sessionId={sessionId}");

      return {
        status: 200,
        headers: { "Content-Type": "application/json" },
        body: Json.stringify(session)
      };
    }
  }
}

bring cloud;
bring "../types.w" as types;
bring "../exceptions" as exceptions;
bring "../ports" as ports;
bring "./defaultSessionHandler.w" as options;

pub class CloseSessionHandler impl cloud.IApiEndpointHandler {
  _table: ports.ISessionTable;

  new(options: options.SessionHandlerOptions) {
    this._table = options.table;
  }

  pub inflight handle(request: cloud.ApiRequest): cloud.ApiResponse {
    let sessionId = request.vars.get("sessionId");
    let session = this._table.closeSession(sessionId);

    if (session == nil) {
      let message = "Failed to update session";
      let exception = new exceptions.InternalServerError(message);

      log(message);

      return {
        status: exception.status.code,
        headers: {
          "Content-Type": "application/json"
        },
        body: Json.stringify(exception.asErr())
      };
    }

    log("Session={Json.stringify(session!)}");

    if (session?.closedAt != nil) {
      let message = "Session already closed";
      let exception = new exceptions.BadRequestError(message);

      log(message);

      return {
        status: exception.status.code,
        headers: {
          "Content-Type": "application/json"
        },
        body: Json.stringify(exception.asErr())
      };
    }

    log("Updated session with sessionId={session!.sessionId}");

    return {
      status: 200,
      headers: {
        "Content-Type": "application/json"
      },
      body: Json.stringify(session)
    };

    let message = "Failed to parse event";
    let exception = new exceptions.BadRequestError(message);

    log(message);

    return {
      status: exception.status.code,
      headers: {
        "Content-Type": "application/json"
      },
      body: Json.stringify(exception.asErr())
    };
  }
}

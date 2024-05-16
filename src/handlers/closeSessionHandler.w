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

    log("sessionId={sessionId}");

    let session = this._table.getSession(sessionId);

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

    let closedSession = this._table.closeSession(sessionId);

    if (closedSession == nil) {
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

    log("Session={Json.stringify(closedSession!)}");

    log("Closed session with sessionId={sessionId}");

    return {
      status: 200,
      headers: {
        "Content-Type": "application/json"
      },
      body: Json.stringify(closedSession)
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

bring cloud;
bring "../exceptions" as exceptions;
bring "../ports" as ports;
bring "./types.w" as types;

pub class GetSessionHandler impl cloud.IApiEndpointHandler {
  _table: ports.ISessionTable;

  new(options: types.SessionHandlerOptions) {
    this._table = options.table;
  }

  pub inflight handle(request: cloud.ApiRequest): cloud.ApiResponse {
    let sessionId = request.vars.get("sessionId");
    let session = this._table.getSession(sessionId);

    if (session == nil) {
      let message = "No record found for session with sessionId={sessionId}";
      let exception = new exceptions.NotFoundError(message);

      log(exception.asStr());

      return cloud.ApiResponse {
        status: exception.status.code,
        headers: { "Content-Type": "application/json" },
        body: Json.stringify(exception.asErr())
      };
    }

    log("Fetched record for session with sessionId={session!.sessionId}");

    return cloud.ApiResponse {
      status: 200,
      headers: { "Content-Type": "application/json" },
      body: Json.stringify(session)
    };
  }
}

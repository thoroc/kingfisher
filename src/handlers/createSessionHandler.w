bring cloud;
bring "../exceptions" as exceptions;
bring "../ports" as ports;
bring "./types.w" as types;

pub class CreateSessionHandler impl cloud.IApiEndpointHandler {
  _table: ports.ISessionTable;

  new(options: types.SessionHandlerOptions) {
    this._table = options.table;
  }

  pub inflight handle(request: cloud.ApiRequest): cloud.ApiResponse {
    let session = this._table.createSession();

    if (session == nil) {
      let message = "Failed to create new session";
      let exceptions = new exceptions.InternalServerError(message);

      log(message);

      return cloud.ApiResponse {
        status: exceptions.status.code,
        headers: {
          "Content-Type": "application/json",
        },
        body: Json.stringify(exceptions.asErr())
      };
    }

    log("Created new session with sessionId={session!.sessionId}");

    return cloud.ApiResponse {
      status: 201 ,
      headers: {
        "Content-Type": "application/json",
      },
      body: Json.stringify(session),
    };
  }
}

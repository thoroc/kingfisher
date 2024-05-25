bring cloud;
bring "../exceptions" as exceptions;
bring "../ports" as ports;
bring "./types.w" as types;
bring "./response.w" as apiResponse;

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

      return new apiResponse.SessionResponseInternalServerError(exceptions.asErr()).toCloudApiResponse();
    }

    log("Created new session with sessionId={session!.sessionId}");

    return new apiResponse.SessionResponseOk(session).toCloudApiResponse();
  }
}

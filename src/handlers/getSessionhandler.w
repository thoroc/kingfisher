bring cloud;
bring "../exceptions" as exceptions;
bring "../ports" as ports;
bring "./types.w" as types;
bring "./response.w" as apiResponse;

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

      return new apiResponse.SessionResponseNotFound(exception.asErr()).toCloudApiResponse();
    }

    log("Fetched record for session with sessionId={session!.sessionId}");

    return new apiResponse.SessionResponseOk(session).toCloudApiResponse();
  }
}

bring cloud;
bring "../../libs/exceptions" as exceptions;
bring "../ports" as ports;
bring "./types.w" as types;
bring "./response.w" as apiResponse;

pub class GetSessionHandler impl ports.IHandler {
  pub id: str;
  _table: ports.ISessionTable;

  new(props: types.SessionHandlerProps) {
    this.id = props.id;
    this._table = props.table;
  }

  pub inflight getSession(sessionId: str): ports.SessionResponse? {
    return this._table.getSession(sessionId);
  }

  pub inflight handle(request: cloud.ApiRequest): cloud.ApiResponse {
    if (request.vars.has("sessionId") == false) {
      let message = "Missing required parameter sessionId";
      let exception = new exceptions.BadRequestError(message);

      log(exception.asStr());

      return new apiResponse.SessionResponseBadRequest(exception.asErr()).toCloudApiResponse();
    }

    let sessionId = request.vars.get("sessionId");
    let session = this._table.getSession(sessionId);

    log("session={Json.stringify(session)}");

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

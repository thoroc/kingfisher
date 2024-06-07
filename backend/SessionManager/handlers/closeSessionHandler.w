bring cloud;
bring "./response.w" as apiResponse;
bring "../../libs/exceptions" as exceptions;
bring "../ports" as ports;
bring "./types.w" as types;

pub class CloseSessionHandler impl ports.ISessionHandler {
  pub id: str;
  _table: ports.ISessionTable;

  new(props: types.SessionHandlerProps) {
    this.id = props.id;
    this._table = props.table;
  }

  pub inflight handle(request: cloud.ApiRequest): cloud.ApiResponse {
    let sessionId = request.vars.get("sessionId");

    log("closeSessionHandler - sessionId={sessionId}");

    let session = this._table.getSession(sessionId);

    if (session?.closedAt != nil) {
      let exception = new exceptions.BadRequestError("Session already closed");
      return new apiResponse.SessionResponseBadRequest(exception.asErr()).toCloudApiResponse();
    }

    let closedSession = this._table.closeSession(sessionId);

    if (closedSession == nil) {
      let expection = new exceptions.InternalServerError("Failed to update session");
      return new apiResponse.SessionResponseInternalServerError(expection.asErr()).toCloudApiResponse();
    }

    log("closeSessionHandler - Session={Json.stringify(closedSession!)}");

    log("closeSessionHandler - Closed session with sessionId={sessionId}");

    return new apiResponse.SessionResponseOk(closedSession).toCloudApiResponse();
  }
}

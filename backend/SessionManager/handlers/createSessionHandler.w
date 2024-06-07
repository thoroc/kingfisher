bring cloud;
bring "../../libs/exceptions" as exceptions;
bring "../ports" as ports;
bring "./types.w" as types;
bring "./response.w" as apiResponse;

pub class CreateSessionHandler impl ports.ISessionHandler {
  pub id: str;
  _table: ports.ISessionTable;

  new(props: types.SessionHandlerProps) {
    this.id = props.id;
    this._table = props.table;
  }

  pub inflight handle(request: cloud.ApiRequest): cloud.ApiResponse {
    let session = this._table.createSession();

    if (session == nil) {
      let message = "Failed to create new session";
      let exceptions = new exceptions.InternalServerError(message);

      log(message);

      return new apiResponse.SessionResponseInternalServerError(exceptions.asErr()).toCloudApiResponse();
    }

    log("createSessionHandler - Created new session with sessionId={session!.sessionId}");

    return new apiResponse.SessionResponseOk(session).toCloudApiResponse();
  }
}

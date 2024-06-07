bring cloud;
bring "../../libs/exceptions" as exceptions;
bring "../ports" as ports;
bring "./types.w" as types;
bring "../core" as core;

pub class UpdateSessionHandler impl ports.ISessionHandler {
  pub id: str;
  _table: ports.ISessionTable;

  new(props: types.SessionHandlerProps) {
    this.id = props.id;
    this._table = props.table;
  }

  pub inflight handle(request: cloud.ApiRequest): cloud.ApiResponse {
    let sessionId = request.vars.get("sessionId");

    log("updatedSessionHandler - sessionId={sessionId}");

    log("updatedSessionHandler - request.body={request.body!}");

    let currSession = this._table.getSession(sessionId);

    log("updatedSessionHandler - currSession={Json.stringify(currSession)}");

    if (currSession?.closedAt != nil) {
      let exception = new exceptions.BadRequestError("Session already closed");
      return new ports.SessionResponseBadRequest(exception.asErr()).toCloudApiResponse();
    }

    log("updatedSessionHandler - Body={request.body!}");
    let jsonBody = Json.tryParse(request.body!);
    // log("User={Json.stringify(ports.User.tryParseJson(request.body!)!)}");

    try {
      let resquestUser = core.User.fromJson(jsonBody?.get("user"));
      log("updatedSessionHandler - Request User={Json.stringify(resquestUser)}");
    } catch e {
      log("updatedSessionHandler - Error={e}");
    }

    if let sessionJson = Json.tryParse(request.body!) {
      let user = core.User.tryFromJson(sessionJson.get("user"));

      if (user == nil) {
        let exception = new exceptions.BadRequestError("Invalid user");

        return new ports.SessionResponseBadRequest(exception.asErr()).toCloudApiResponse();
      }

      log("updatedSessionHandler - Udating session with sessionId={sessionId} user={Json.stringify(user)}");

      let sessionRequest = ports.SessionRequest {
        sessionId: sessionId,
        user: user!
      };

      log("updatedSessionHandler - sessionRequest={Json.stringify(sessionRequest)}");

      let updatedSession = this._table.updateSession(ports.SessionRequest {
        sessionId: sessionId,
        user: user!
      });

      log("updatedSessionHandler - Updated session with sessionId={sessionId}");

      return new ports.SessionResponseOk(updatedSession).toCloudApiResponse();
    }

    let exception = new exceptions.BadRequestError("Invalid request body");
    return new ports.SessionResponseBadRequest(exception.asErr()).toCloudApiResponse();
  }
}

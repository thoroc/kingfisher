bring cloud;
bring "../../libs/exceptions" as exceptions;
bring "../ports" as ports;
bring "./types.w" as types;
bring "./response.w" as apiResponse;

pub class UpdateSessionHandler impl ports.IHandler {
  pub id: str;
  _table: ports.ISessionTable;

  new(props: types.SessionHandlerProps) {
    this.id = props.id;
    this._table = props.table;
  }

  pub inflight handle(request: cloud.ApiRequest): cloud.ApiResponse {
    let sessionId = request.vars.get("sessionId");

    log("sessionId={sessionId}");

    log("request.body={request.body!}");

    let currSession = this._table.getSession(sessionId);

    log("currSession={Json.stringify(currSession)}");

    if (currSession?.closedAt != nil) {
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

    if let sessionJson = Json.tryParse(request.body!) {
      let user = ports.User.tryFromJson(sessionJson.get("user"));

      if (user == nil) {
        let exception = new exceptions.BadRequestError("Invalid user");

        return new apiResponse.SessionResponseBadRequest(exception.asErr()).toCloudApiResponse();
      }

      log("Udating session with sessionId={sessionId} user={Json.stringify(user)}");

      let updatedSession = this._table.updateSession(ports.SessionRequest {
        sessionId: sessionId,
        user: user!
      });

      log("Updated session with sessionId={sessionId}");

      return new apiResponse.SessionResponseOk(updatedSession).toCloudApiResponse();
    }

    let exception = new exceptions.BadRequestError("Invalid request body");

    return new apiResponse.SessionResponseBadRequest(exception.asErr()).toCloudApiResponse();
  }
}

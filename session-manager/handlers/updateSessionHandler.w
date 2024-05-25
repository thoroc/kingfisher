bring cloud;
bring "../exceptions" as exceptions;
bring "../ports" as ports;
bring "./types.w" as types;
bring "./response.w" as apiResponse;

pub class UpdateSessionHandler impl cloud.IApiEndpointHandler {
  _table: ports.ISessionTable;

  new(options: types.SessionHandlerOptions) {
    this._table = options.table;
  }

  pub inflight handle(request: cloud.ApiRequest): cloud.ApiResponse {
    let sessionId = request.vars.get("sessionId");

    log("sessionId={sessionId}");

    log("request.body={request.body!}");

    let currSession = this._table.getSession(sessionId);

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

      let updatedSession = this._table.updateSession(ports.SessionRequest {
        sessionId: sessionId,
        user: user!
      });

      log("Updated session with sessionId={sessionId}");

      return new apiResponse.SessionResponseOk(updatedSession).toCloudApiResponse();
    }
  }
}

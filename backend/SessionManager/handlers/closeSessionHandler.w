bring cloud;
bring "../../libs/exceptions" as exceptions;
bring "../ports" as ports;
bring "./types.w" as types;

pub class CloseSessionHandler impl ports.IHandler {
  pub id: str;
  _table: ports.ISessionTable;

  new(props: types.SessionHandlerProps) {
    this.id = props.id;
    this._table = props.table;
  }

  pub inflight handle(request: cloud.ApiRequest): cloud.ApiResponse {
    let sessionId = request.vars.get("sessionId");

    log("sessionId={sessionId}");

    let session = this._table.getSession(sessionId);

    if (session?.closedAt != nil) {
      let message = "Session already closed";
      let exception = new exceptions.BadRequestError(message);

      return {
        status: exception.status.code,
        headers: {
          "Content-Type": "application/json"
        },
        body: Json.stringify(exception.asErr())
      };
    }

    let closedSession = this._table.closeSession(sessionId);

    if (closedSession == nil) {
      let message = "Failed to update session";
      let exception = new exceptions.InternalServerError(message);

      return {
        status: exception.status.code,
        headers: {
          "Content-Type": "application/json"
        },
        body: Json.stringify(exception.asErr())
      };
    }

    log("Session={Json.stringify(closedSession!)}");

    log("Closed session with sessionId={sessionId}");

    return {
      status: 200,
      headers: {
        "Content-Type": "application/json"
      },
      body: Json.stringify(closedSession)
    };

    let message = "Failed to parse event";
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
}

bring cloud;
bring "../ports" as ports;
bring "./types.w" as types;
bring "./response.w" as apiResponse;

pub class ListSessionsHandler impl ports.IHandler {
  pub id: str;
  _table: ports.ISessionTable;

  new(props: types.SessionHandlerProps) {
    this.id = props.id;
    this._table = props.table;
  }

  pub inflight handle(request: cloud.ApiRequest): cloud.ApiResponse {
    let sessions = this._table.listSessions();

    return new apiResponse.SessionResponseOk(sessions).toCloudApiResponse();
  }
}
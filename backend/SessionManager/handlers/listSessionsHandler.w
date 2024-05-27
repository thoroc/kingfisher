bring cloud;
bring "../ports" as ports;
bring "./types.w" as types;
bring "./response.w" as apiResponse;

pub class ListSessionsHandler impl cloud.IApiEndpointHandler {
  _table: ports.ISessionTable;

  new(options: types.SessionHandlerOptions) {
    this._table = options.table;
  }

  pub inflight handle(request: cloud.ApiRequest): cloud.ApiResponse {
    let sessions = this._table.listSessions();

    return new apiResponse.SessionResponseOk(sessions).toCloudApiResponse();
  }
}
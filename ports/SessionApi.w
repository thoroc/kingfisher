bring cloud;
bring http;
bring "../adapters/IRestApiAdapter.w" as restApiAdapter;

pub class SessionRestApi{
    _apiUrl: str;
    _adapter: restApiAdapter.IRestApiAdapter;

    new(adapter: restApiAdapter.IRestApiAdapter) {
        let api = new cloud.Api();
        this._adapter = adapter;

        api.get("/session", inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
            return this._adapter.handle(request);
        });

        this._apiUrl = api.url;
    }

    pub inflight invoke(sessionId: str): str {
        let result = http.get("{this._apiUrl}/session?id={sessionId}");
        assert(200 == result.status);

        return result.body;
    }
}
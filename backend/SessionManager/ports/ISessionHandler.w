bring cloud;

pub inflight interface ISessionHandler {
  inflight handle(request: cloud.ApiRequest): cloud.ApiResponse;
}
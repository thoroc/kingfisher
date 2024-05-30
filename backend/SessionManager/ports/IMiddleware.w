bring cloud;

pub inflight interface IMiddleware {
  inflight handle(request: cloud.ApiRequest, next: inflight (cloud.ApiRequest): cloud.ApiResponse): cloud.ApiResponse;
}
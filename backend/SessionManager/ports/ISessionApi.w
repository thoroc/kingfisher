bring cloud;
bring "./ISessionTable.w" as ISessionTable;
bring "./ISessionHandler.w" as ISessionHandler;

pub struct ApiResponse {
  status: num;
  headers: Map<str>;
  body: str;
}

pub struct ApiRequest {
  status: num;
  headers: Map<str>;
  body: str;
}

pub inflight interface IMiddleware {
  inflight handle(request: cloud.ApiRequest, next: inflight (cloud.ApiRequest): cloud.ApiResponse): cloud.ApiResponse;
}

pub interface ISessionApi {
  addMiddleware(middleware: IMiddleware): void;
  connect(path: str, handler: ISessionHandler.ISessionHandler): void;
  delete(path: str, handler: ISessionHandler.ISessionHandler): void;
  get(path: str, handler: ISessionHandler.ISessionHandler): void;
  head(path: str, handler: ISessionHandler.ISessionHandler): void;
  options(path: str, handler: ISessionHandler.ISessionHandler): void;
  patch(path: str, handler: ISessionHandler.ISessionHandler): void;
  post(path: str, handler: ISessionHandler.ISessionHandler): void;
  put(path: str, handler: ISessionHandler.ISessionHandler): void;
}
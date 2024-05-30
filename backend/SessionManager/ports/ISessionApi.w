bring cloud;
bring "./ISessionTable.w" as ISessionTable;

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

pub interface IHandler {
  inflight handle(request: cloud.ApiRequest): cloud.ApiResponse;
}

pub interface IMiddleware {
  inflight invoke(request: cloud.ApiRequest): cloud.ApiResponse;
}

pub interface ISessionApi {
  addMiddleware(middleware: IMiddleware): void;
  connect(path: str, handler: IHandler): void;
  delete(path: str, handler: IHandler): void;
  get(path: str, handler: IHandler): void;
  head(path: str, handler: IHandler): void;
  options(path: str, handler: IHandler): void;
  patch(path: str, handler: IHandler): void;
  post(path: str, handler: IHandler): void;
  put(path: str, handler: IHandler): void;
}
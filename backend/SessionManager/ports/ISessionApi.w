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
  inflight handle(request: ApiRequest): ApiResponse;
}

pub interface IMiddleware {
  inflight handle(request: ApiRequest, response: ApiResponse): void;
}

pub interface ISessionApi {
  addMiddleware(middleware: IMiddleware): void;
  get(path: str, handler: IHandler, request: ApiRequest): ApiResponse;
  post(path: str, handler: IHandler, request: ApiRequest): ApiResponse;
  put(path: str, handler: IHandler, request: ApiRequest): ApiResponse;
}
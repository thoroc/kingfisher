bring cloud;
bring "./ISessionApi.w" as ISessionApi;

pub struct SessionApiProps {
  api: cloud.Api?;
}

pub class SessionApi impl ISessionApi.ISessionApi {
  pub api: cloud.Api;
  _middlewares: MutArray<ISessionApi.IMiddleware>;

  new(props: SessionApiProps) {
    this.api = props.api ?? new cloud.Api();
    this._middlewares = MutArray<ISessionApi.IMiddleware>[];
  }

  pub addMiddleware(middleware: ISessionApi.IMiddleware) {
    this._middlewares.push(middleware);
  }

  pub connect(path: str, handler: ISessionApi.IHandler): void {
    this.api.connect(path, inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
      return handler.handle(request);
    });
  }

  pub delete(path: str, handler: ISessionApi.IHandler): void {
    this.api.delete(path, inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
      return handler.handle(request);
    });
  }

  pub get(path: str, handler: ISessionApi.IHandler): void {
    this.api.post(path, inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
      return handler.handle(request);
    });
  }

  pub head(path: str, handler: ISessionApi.IHandler): void {
    this.api.head(path, inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
      return handler.handle(request);
    });
  }

  pub options(path: str, handler: ISessionApi.IHandler): void {
    this.api.options(path, inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
      return handler.handle(request);
    });
  }

  pub patch(path: str, handler: ISessionApi.IHandler): void {
    this.api.patch(path, inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
      return handler.handle(request);
    });
  }

  pub post(path: str, handler: ISessionApi.IHandler): void {
    this.api.post(path, inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
      return handler.handle(request);
    });
  }

  pub put(path: str, handler: ISessionApi.IHandler): void {
    this.api.post(path, inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
      return handler.handle(request);
    });
  }
}
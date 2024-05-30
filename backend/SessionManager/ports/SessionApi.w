bring cloud;
bring "./ISessionApi.w" as ISessionApi;

pub struct SessionApiProps {
  api: cloud.Api;
}

pub class SessionApi impl ISessionApi.ISessionApi {
  pub api: cloud.Api;
  _middlewares: MutArray<ISessionApi.IMiddleware>;

  new(props: SessionApiProps) {
    this.api = props.api;
    this._middlewares = MutArray<ISessionApi.IMiddleware>[];
  }

  pub addMiddleware(middleware: ISessionApi.IMiddleware) {
    this._middlewares.push(middleware);
  }

  pub get(path: str, handler: ISessionApi.IHandler, request: ISessionApi.ApiRequest): ISessionApi.ApiResponse {
    return {
      status: 200,
      headers: {},
      body: "Hello, World!"
    };
  }

  pub post(path: str, handler: ISessionApi.IHandler, request: ISessionApi.ApiRequest): ISessionApi.ApiResponse {
    return {
      status: 200,
      headers: {},
      body: "Hello, World!"
    };
  }

  pub put(path: str, handler: ISessionApi.IHandler, request: ISessionApi.ApiRequest): ISessionApi.ApiResponse {
    return {
      status: 200,
      headers: {},
      body: "Hello, World!"
    };
  }
}
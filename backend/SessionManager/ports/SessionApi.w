bring cloud;
bring "./ISessionApi.w" as ISessionApi;
bring "../../libs/http" as http;

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

  wrapHandler(
    handler: ISessionApi.IHandler,
  ): inflight (cloud.ApiRequest): cloud.ApiResponse {
    let applyMiddlewares = inflight (request: cloud.ApiRequest, index: num?): cloud.ApiResponse => {
      log("{index ?? 0}");

      if let middleware = this._middlewares.tryAt(index ?? 0) {
        let next = (request: cloud.ApiRequest): cloud.ApiResponse => {
          let newIndex = (index ?? 0) + 1;
          if newIndex < this._middlewares.length {
            return applyMiddlewares(request, newIndex);
          }
          return handler(request);
        };
        return middleware.handle(request, next);
      }
      return handler(request);
    };

    return inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
      try {
        let response = applyMiddlewares(request);

        let headers = response.headers?.copyMut();
        headers?.set("content-type", "application/json");

        let var bodyStr = "";
        if let body = response.body {
          bodyStr = Json.stringify(body);
        }

        return {
          status: response.status ?? 200,
          headers: headers?.copy(),
          body: bodyStr,
        };
      } catch error {
        if let httpError = http.HttpStatus.tryFromJson(Json.tryParse(error)) {
          return {
            status: httpError.code,
            headers: {
              "content-type": "application/json",
            },
            body: Json.stringify({
              error: httpError.message,
            }),
          };
        }

        log("Internal server error");
        log(unsafeCast(error));

        return {
          status: 500,
          headers: {
            "content-type": "application/json",
          },
          body: Json.stringify({
            error: "Internal server error",
          }),
        };
      }
    };
  }

  pub addMiddleware(middleware: ISessionApi.IMiddleware) {
    this._middlewares.push(middleware);
  }

  pub connect(path: str, handler: ISessionApi.IHandler): void {
    this.api.connect(path, this.wrapHandler(handler));
  }

  pub delete(path: str, handler: ISessionApi.IHandler): void {
    this.api.delete(path, this.wrapHandler(handler));
  }

  pub get(path: str, handler: ISessionApi.IHandler): void {
    this.api.get(path, this.wrapHandler(handler));
  }

  pub head(path: str, handler: ISessionApi.IHandler): void {
    this.api.head(path, this.wrapHandler(handler));
  }

  pub options(path: str, handler: ISessionApi.IHandler): void {
    this.api.options(path, this.wrapHandler(handler));
  }

  pub patch(path: str, handler: ISessionApi.IHandler): void {
    this.api.patch(path, this.wrapHandler(handler));
  }

  pub post(path: str, handler: ISessionApi.IHandler): void {
    this.api.post(path, this.wrapHandler(handler, ));
  }

  pub put(path: str, handler: ISessionApi.IHandler): void {
    this.api.put(path, this.wrapHandler(handler));
  }
}
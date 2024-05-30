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
    handler: inflight (cloud.ApiRequest): cloud.ApiResponse,
    middlewares: Array<ISessionApi.IMiddleware>,
  ): inflight (cloud.ApiRequest): cloud.ApiResponse {
    class ApplyMiddleware {
      pub inflight apply(request: cloud.ApiRequest, index: num?): cloud.ApiResponse  {
        if let middleware = middlewares.tryAt(index ?? 0) {
          let next = (request: cloud.ApiRequest): cloud.ApiResponse => {
            let newIndex = (index ?? 0) + 1;
            if newIndex < middlewares.length {
              return this.apply(request, newIndex);
            }
            return handler(request);
          };
          return middleware.handle(request, next);
        }

        return handler(request);
      }
    }

    let applyMiddleware = new ApplyMiddleware();

    return inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
      try {
        let response = applyMiddleware.apply(request);

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
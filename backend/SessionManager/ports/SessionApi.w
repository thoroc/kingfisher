bring cloud;
bring "./ISessionApi.w" as ISessionApi;
bring "./ISessionHandler.w" as ISessionHandler;
bring "./IMiddleware.w" as IMiddleware;
bring "../../libs/http" as http;

pub struct SessionApiProps {
  api: cloud.Api?;
  cors: bool?;
}

pub class SessionApi impl ISessionApi.ISessionApi {
  pub api: cloud.Api;
  _middlewares: MutArray<IMiddleware.IMiddleware>;
  var _handlerCount: num;

  new(props: SessionApiProps) {
    this.api = props.api ?? new cloud.Api(cors: props.cors ?? true);
    this._middlewares = MutArray<IMiddleware.IMiddleware>[];
    this._handlerCount = 0;
  }

  wrapHandler(
    handler: ISessionHandler.ISessionHandler,
  ): inflight (cloud.ApiRequest): cloud.ApiResponse {
    class ApplyMiddleware {

      _middlewares: MutArray<IMiddleware.IMiddleware>;

      new(middleware: MutArray<IMiddleware.IMiddleware>) {
        this._middlewares = middleware;
        nodeof(this).hidden = true;
      }

      pub inflight apply(request: cloud.ApiRequest, index: num?): cloud.ApiResponse  {
        log("{index ?? 0}");

        if let middleware = this._middlewares.tryAt(index ?? 0) {
          let next = (request: cloud.ApiRequest): cloud.ApiResponse => {
            let newIndex = (index ?? 0) + 1;
            if newIndex < this._middlewares.length {
              return this.apply(request, newIndex);
            }
            return handler(request);
          };
          return middleware.handle(request, next);
        }
        return handler(request);
      }
    }

    this._handlerCount += 1;

    let applyMiddleware = new ApplyMiddleware(this._middlewares) as "ApplyMiddlewareInstance-{this._handlerCount}";

    return inflight (request: cloud.ApiRequest): cloud.ApiResponse => {
      try {
        let response = applyMiddleware.apply(request);

        let headers = response.headers?.copyMut();
        headers?.set("content-type", "application/json");

        return {
          status: response.status ?? 200,
          headers: headers?.copy(),
          body: response.body,
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

  pub addMiddleware(middleware: IMiddleware.IMiddleware) {
    this._middlewares.push(middleware);
  }

  pub connect(path: str, handler: ISessionHandler.ISessionHandler): void {
    this.api.connect(path, this.wrapHandler(handler));
  }

  pub delete(path: str, handler: ISessionHandler.ISessionHandler): void {
    this.api.delete(path, this.wrapHandler(handler));
  }

  pub get(path: str, handler: ISessionHandler.ISessionHandler): void {
    this.api.get(path, this.wrapHandler(handler));
  }

  pub head(path: str, handler: ISessionHandler.ISessionHandler): void {
    this.api.head(path, this.wrapHandler(handler));
  }

  pub options(path: str, handler: ISessionHandler.ISessionHandler): void {
    this.api.options(path, this.wrapHandler(handler));
  }

  pub patch(path: str, handler: ISessionHandler.ISessionHandler): void {
    this.api.patch(path, this.wrapHandler(handler));
  }

  pub post(path: str, handler: ISessionHandler.ISessionHandler): void {
    this.api.post(path, this.wrapHandler(handler, ));
  }

  pub put(path: str, handler: ISessionHandler.ISessionHandler): void {
    this.api.put(path, this.wrapHandler(handler));
  }
}
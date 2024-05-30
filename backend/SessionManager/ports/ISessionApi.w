bring cloud;
bring "./ISessionHandler.w" as ISessionHandler;
bring "./IMiddleware.w" as IMiddleware;

pub interface ISessionApi {
  addMiddleware(middleware: IMiddleware.IMiddleware): void;
  connect(path: str, handler: ISessionHandler.ISessionHandler): void;
  delete(path: str, handler: ISessionHandler.ISessionHandler): void;
  get(path: str, handler: ISessionHandler.ISessionHandler): void;
  head(path: str, handler: ISessionHandler.ISessionHandler): void;
  options(path: str, handler: ISessionHandler.ISessionHandler): void;
  patch(path: str, handler: ISessionHandler.ISessionHandler): void;
  post(path: str, handler: ISessionHandler.ISessionHandler): void;
  put(path: str, handler: ISessionHandler.ISessionHandler): void;
}
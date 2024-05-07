bring "./core" as core;
bring "./adapters" as adapters;
bring "./handlers" as handlers;
bring "./ports" as ports;


pub class Session {
  pub api: ports.SessionRestApi;

  new() {
    let getSessionHandler = new handlers.GetSessionHandler();
    let sessionApiAdapter = new adapters.SessionApiAdapter(getSessionHandler);
    this.api = new ports.SessionRestApi(sessionApiAdapter);
  }
}

let session = new Session();
bring cloud;
bring util;

pub class PostSessionHandler impl cloud.IFunctionHandler {
  pub inflight handle(event: str?): str? {
    let sessionId = util.uuidv4();
    log("Hello {sessionId} from the PostSessionHandler");

    return sessionId;
  }
}

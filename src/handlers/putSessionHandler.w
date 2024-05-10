bring cloud;

pub class PutSessionHandler impl cloud.IFunctionHandler {
  pub inflight handle(event: str?): str? {
    log("Hello {event!} from the PutSessionHandler!");
    return event;
  }
}

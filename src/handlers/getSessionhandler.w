bring cloud;

pub class GetSessionHandler impl cloud.IFunctionHandler {
  pub inflight handle(event: str?): str? {
    log("Hello {event!} from the GetSessionHandler!");
    return event;
  }
}

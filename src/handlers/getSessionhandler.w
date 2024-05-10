bring cloud;

pub class GetSessionHandler impl cloud.IFunctionHandler {
  pub inflight handle(event: str?): str? {
    return "Hello {event!} from the Handler!";
  }
}

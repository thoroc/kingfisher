bring cloud;

pub class GetSessionHandler impl cloud.IFunctionHandler {
  pub inflight handle(event: str?): str {
    if event == "nil" {
      log("No event received");
      return "nil";
    }

    log("Received event: {event!}");

    let session: Json = Json.parse(event ?? "nil");

    log("Received id: {session}");
    let message = "id: {session}";

    return message;
  }
}

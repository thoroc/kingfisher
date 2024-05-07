bring cloud;

pub class GetSessionHandler impl cloud.IFunctionHandler {
  pub inflight handle(event: str?): str {
    if event == "nil" {
      log("No event received");
      return "nil";
    }

    let id: Json = Json.parse(event ?? "nil");

    log("Received id: {id}");
    let message = "id: {id}";

    return message;
  }
}

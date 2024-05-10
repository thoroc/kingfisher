bring cloud;
bring dynamodb;

pub class GetSessionHandler impl cloud.IFunctionHandler {
  _table: dynamodb.Table;

  new(table: dynamodb.Table) {
    this._table = table;
  }

  pub inflight handle(sessionId: str?): str? {
    log("Getting record for session with sessionId={sessionId!}");

    let data = this._table.get(
      Key: {
        sessionId: sessionId
      }
    );

    if (data.Item == nil) {
      return Json.stringify({"error": "No record for sessionId={sessionId!}"});
    }

    let session = Json.stringify(data.Item);

    return Json.stringify(session);
  }
}

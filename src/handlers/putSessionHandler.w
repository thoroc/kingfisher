bring cloud;
bring dynamodb;
bring "../types.w" as types;

pub class PutSessionHandler impl cloud.IFunctionHandler {
  _table: dynamodb.Table;

  new(options: types.SessionHandlerOptions) {
    this._table = options.table;
  }

  pub inflight handle(sessionId: str?): str? {
    log("Updating session with sessionId={sessionId!}");

    let data = this._table.get(
      Key: {
        sessionId: sessionId
      }
    );

    if (data.Item == nil) {
      return Json.stringify({"error": "No record for sessionId={sessionId!}"});
    }

    let session = data.Item;

    let updated = types.Session {
      sessionId: Json.stringify(session?.get("sessionId")),
      createdAt: Json.stringify(session?.get("createdAt")),
      updatedAt: std.Datetime.utcNow().toIso()
    };

    this._table.put(
      Item: updated
    );

    return sessionId;
  }
}

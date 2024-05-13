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
      sessionId: str.fromJson(session?.get("sessionId")),
      createdAt: str.fromJson(session?.get("createdAt")),
      updatedAt: std.Datetime.utcNow().toIso()
    };

    log(Json.stringify(updated));

    this._table.put(
      Item: updated
    );

    return Json.stringify(updated);
  }
}

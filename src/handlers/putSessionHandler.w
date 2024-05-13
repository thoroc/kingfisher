bring cloud;
bring dynamodb;
bring "../types.w" as types;

pub class PutSessionHandler impl cloud.IFunctionHandler {
  _table: dynamodb.Table;
  _credentials: dynamodb.Credentials?;

  new(options: types.SessionHandlerOptions) {
    this._table = options.table;
    this._credentials = options.clientOptions?.clientConfig?.credentials;
  }

  pub inflight handle(sessionId: str?): str? {
    log("Updating session with sessionId={sessionId!}");

    let client = new dynamodb.Client({
      tableName: this._table.tableName, 
      // credentials: this._credentials
      credentials: {
        accessKeyId: this._credentials?.accessKeyId!, 
        secretAccessKey: this._credentials?.secretAccessKey!
      }
    });

    let data = client.get(
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

    client.put(
      Item: updated
    );

    return sessionId;
  }
}

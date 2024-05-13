bring cloud;
bring dynamodb;
bring util;
bring "../types.w" as types;


pub class PostSessionHandler impl cloud.IFunctionHandler {
  _table: dynamodb.Table;
  _credentials: dynamodb.Credentials?;

  new(options: types.SessionHandlerOptions) {
    this._table = options.table;
    this._credentials = options.credentials;
  }

  pub inflight handle(event: str?): str? {
    let sessionId = util.uuidv4();
    log("Creating new session with sessionId={sessionId}");

    let client = new dynamodb.Client({
      tableName: this._table.tableName, 
      // credentials: this._credentials
      credentials: {
        accessKeyId: this._credentials?.accessKeyId!, 
        secretAccessKey: this._credentials?.secretAccessKey!
      }
    });

    let data = types.Session {
      sessionId: sessionId, 
      createdAt: std.Datetime.utcNow().toIso()
    };

    client.put(
      Item: data
    );

    return sessionId;
  }
}

bring cloud;
bring dynamodb;

pub class PutSessionHandler impl cloud.IFunctionHandler {
  _table: dynamodb.Table;

  new(table: dynamodb.Table) {
    this._table = table;
  }

  pub inflight handle(sessionId: str?): str? {
    log("Updating session with sessionId={sessionId!}");
    return sessionId;
  }
}

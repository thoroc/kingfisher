bring cloud;
bring ex;

pub class PutSessionHandler impl cloud.IFunctionHandler {
  _table: ex.Table;

  new(table: ex.Table) {
    this._table = table;
  }

  pub inflight handle(event: str?): str? {
    log("Hello {event!} from the PutSessionHandler!");
    return event;
  }
}

bring cloud;
bring ex;

pub class GetSessionHandler impl cloud.IFunctionHandler {
  _table: ex.Table;

  new(table: ex.Table) {
    this._table = table;
  }

  pub inflight handle(event: str?): str? {
    log("Hello {event!} from the GetSessionHandler!");
    return event;
  }
}

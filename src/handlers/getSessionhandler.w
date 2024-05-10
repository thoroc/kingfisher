bring cloud;
bring dynamodb;

pub class GetSessionHandler impl cloud.IFunctionHandler {
  _table: dynamodb.Table;

  new(table: dynamodb.Table) {
    this._table = table;
  }

  pub inflight handle(sessionId: str?): str? {
    log("Getting record for session with sessionId={sessionId!}");

    let response = this._table.query(
      KeyConditionExpression: "sessionId = :id",
      ExpressionAttributeValues: {":id": sessionId},
    );

    let count = response.Count;

    log("Total number of records for {sessionId!}: {count}");

    log("Data={Json.stringify(response)}");
    // log("Item={Json.stringify(data.get("Item"))}");

    // Example of data returned here
    // let example = {
    //   "$metadata": {
    //     "httpStatusCode":200,
    //     "requestId":"4ddc34c9-5ab9-4205-afa1-0b63649e09cc",
    //     "attempts":1,
    //     "totalRetryDelay":0
    //   },
    //   "Item":{
    //     "createdAt":"2024-05-10T14:29:16.888Z",
    //     "sessionId":"fbae7733-96f7-4031-9367-06bd3daf98dd"
    //   }
    // };

    let data = this._table.get(
      Key: {
        sessionId: sessionId
      }
    );

    let session = data.Item;

    log(Json.stringify(data.Item));

    if (session == nil) {
      return Json.stringify({"error": "No record for sessionId={sessionId!}"});
    }
    let result = {sessionId: sessionId};

    return Json.stringify(result);
    // return Json.stringify(data?.getItem());
  }
}

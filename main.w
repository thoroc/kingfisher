bring cloud;
bring dynamodb;
bring expect;

let db = new dynamodb.Table(
  name: "MyTable",
  attributes: [
    {
      name: "ID",
      type: "S"
    }
  ],
  hashKey: "ID"
);

let fn = new cloud.Function(inflight () => {
  let record = db.get(
    Key: {
      ID: "id"
    }
  );

  return "hello, world";
});

test "fn returns hello" {
  expect.equal(fn.invoke(""), "hello, world");
}

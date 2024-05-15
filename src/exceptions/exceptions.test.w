bring expect;
bring "./exceptions.w" as exception;

test "creates new Exception" {
  let tag = "test";
  let message = "Error Message";

  let e = new exception.Exception(tag, message);

  expect.equal(e.tag, tag);
  expect.equal(e.message, message);
}

// test "Throws an error" {
//   let tag = "test";
//   let message = "Error Message";

//   let e = new exception.Exception(tag, message);

//   expect.ok()
// }

test "creates new Exception from Json" {
  let tag = "test";
  let message = "Error Message";

  let e = new exception.Exception(tag, message);
  let json = {
    "tag": tag,
    "message": message
  };

  let e2 = exception.Exception.fromJson(Json.stringify(json));

  expect.equal(e2.tag, tag);
  expect.equal(e2.message, message);
}

test "Returns Exception as Json" {
  let tag = "test";
  let message = "Error Message";

  let e = new exception.Exception(tag, message);
  let json = {
    "tag": tag,
    "message": message
  };

  expect.equal(e.toJson(), json);
}

test "Create a KeyError Exception" {
  let message = "test";

  let e = new exception.KeyError(message);

  expect.equal(e.tag, "KeyError");
  expect.equal(e.message, message);
}

test "Create a ValueError Exception" {
  let message = "test";

  let e = new exception.ValueError(message);

  expect.equal(e.tag, "ValueError");
  expect.equal(e.message, message);
}
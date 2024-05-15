bring expect;
bring "./exceptions.w" as sut;

test "creates new Exception" {
  let tag = "test";
  let message = "Error Message";

  let exception = new sut.Exception(tag, message);

  expect.equal(exception.tag, tag);
  expect.equal(exception.message, message);
}

// test "Throws an error" {
//   let tag = "test";
//   let message = "Error Message";

//   let exception = new exception.Exception(tag, message);

//   expect.ok()
// }

test "creates new Exception from Json" {
  let tag = "test";
  let message = "Error Message";

  let json = {
    "tag": tag,
    "message": message
  };

  let exception = sut.Exception.fromJson(Json.stringify(json));

  expect.equal(exception.tag, tag);
  expect.equal(exception.message, message);
}

test "Returns Exception as Json" {
  let tag = "test";
  let message = "Error Message";

  let exception = new sut.Exception(tag, message);
  let json = {
    "tag": tag,
    "message": message
  };

  expect.equal(exception.toJson(), json);
}

test "Create a KeyError Exception" {
  let message = "test";

  let exception = new sut.KeyError(message);

  expect.equal(exception.tag, "KeyError");
  expect.equal(exception.message, message);
}

test "Create a ValueError Exception" {
  let message = "test";

  let exception = new sut.ValueError(message);

  expect.equal(exception.tag, "ValueError");
  expect.equal(exception.message, message);
}
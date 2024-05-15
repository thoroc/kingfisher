bring expect;
bring "../http" as http;
bring "./httpExceptions.w" as sut;

test "Creates a new HttpException with Default Message" {
  let status = http.HttpStatuses.NOT_FOUND;
  let expected = http.HttpStatus {
    code: 404,
    message: "Not Found"
  };

  let exception = new sut.HttpException(status);

  expect.equal(exception.status.code, expected.code);
  expect.equal(exception.status.message, expected.message);
}

test "Creates a new HttpException with custom Message" {
  let status = http.HttpStatuses.NOT_FOUND;
  let expected = http.HttpStatus {
    code: 404,
    message: "Not the droids you're looking for"
  };

  let exception = new sut.HttpException(status, "Not the droids you're looking for");

  expect.equal(exception.status.code, expected.code);
  expect.equal(exception.status.message, expected.message);
}

test "Returns a string" {
  let status = http.HttpStatuses.NOT_FOUND;

  let exception = new sut.HttpException(status, "Not the droids you're looking for");

  expect.equal(exception.asStr(), "404 - Not the droids you're looking for");
}

test "Returns a Json" {
  let status = http.HttpStatuses.NOT_FOUND;

  let exception = new sut.HttpException(status, "Not the droids you're looking for");

  let expected = {
    code: 404,
    message: "Not the droids you're looking for"
  };

  expect.equal(exception.asJson(), expected);
}

test "Creates a BadRequestError - Ok" {
  let exception = new sut.BadRequestError("Not the droids you're looking for");

  let expected = http.HttpStatus {
    code: 400,
    message: "Bad Request"
  };

  expect.equal(exception.asJson(), expected);
}
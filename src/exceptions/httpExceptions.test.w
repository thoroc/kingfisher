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
  let message = "Not the droids you're looking for";

  let exception = new sut.BadRequestError(message);

  let expected = http.HttpStatus {
    code: 400,
    message: message
  };

  expect.equal(exception.asJson(), expected);
}

test "Creates a AuthenticationError - Ok" {
  let message = "You are not logged in";

  let exception = new sut.AuthenticationError(message);

  let expected = http.HttpStatus {
    code: 401,
    message: message
  };

  expect.equal(exception.asJson(), expected);
}

test "Creates a AuthorizationError - Ok" {
  let message = "You are not allowed to do that";

  let exception = new sut.AuthorizationError(message);

  let expected = http.HttpStatus {
    code: 403,
    message: message
  };

  expect.equal(exception.asJson(), expected);
}

test "Creates a NotFoundError - Ok" {
  let message = "Those are not the droids you're looking for";

  let exception = new sut.NotFoundError(message);

  let expected = http.HttpStatus {
    code: 404,
    message: message
  };

  expect.equal(exception.asJson(), expected);
}

test "Creates a MethodNotAllowedError - Ok" {
  let message = "This is not the way to do it";

  let exception = new sut.MethodNotAllowedError(message);

  let expected = http.HttpStatus {
    code: 405,
    message: message
  };

  expect.equal(exception.asJson(), expected);
}

test "Creates a GoneError - Ok" {
  let message = "The resource is no longer available";

  let exception = new sut.GoneError(message);

  let expected = http.HttpStatus {
    code: 410,
    message: message
  };

  expect.equal(exception.asJson(), expected);
}

test "Creates an InternalServerError - Ok" {
  let message = "Something went wrong";

  let exception = new sut.InternalServerError(message);

  let expected = http.HttpStatus {
    code: 500,
    message: message
  };

  expect.equal(exception.asJson(), expected);
}

test "Creates a NotImplementedError - Ok" {
  let message = "This feature is not implemented yet";

  let exception = new sut.NotImplementedError(message);

  let expected = http.HttpStatus {
    code: 501,
    message: message
  };

  expect.equal(exception.asJson(), expected);
}

test "Creates a BadGatewayError - Ok" {
  let message = "The server received an invalid response";

  let exception = new sut.BadGatewayError(message);

  let expected = http.HttpStatus {
    code: 502,
    message: message
  };

  expect.equal(exception.asJson(), expected);
}

test "Creates a ServiceUnavailableError - Ok" {
  let message = "The server is currently unavailable";

  let exception = new sut.ServiceUnavailableError(message);

  let expected = http.HttpStatus {
    code: 503,
    message: message
  };

  expect.equal(exception.asJson(), expected);
}
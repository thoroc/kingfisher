bring "./exceptions.w" as exceptions;
bring "../http" as http;

pub struct Error {
  error: http.HttpStatus;
  message: str?;
}

// HTTP exceptions
pub inflight class HttpException {
  pub status: http.HttpStatus;

  new(status: http.HttpStatuses, message: str?) {
    let local = http.HttpStatusTransformer.fromStatusEnum(status);

    this.status = http.HttpStatus {
      code: local.code,
      message: message ?? local.message
    };
  }

  pub asErr(): Error {
    return Error {
      error: {
        code: this.status.code,
        message: this.status.message
      }
    };
  }

  pub asJson(): Json {
    return {
      code: this.status.code,
      message: this.status.message
    };
  }

  pub asStr(): str {
    return "{this.status.code} - {this.status.message}";
  }
}

// 400 Bad Request
pub inflight class BadRequestError extends HttpException {
  new(message: str?) {
    super(http.HttpStatuses.BAD_REQUEST, message);
  }
}

// 401 Unauthorized
pub inflight class AuthenticationError extends HttpException {
  new(message: str?) {
    super(http.HttpStatuses.UNAUTHORIZED, message);
  }
}

// 403 Forbidden
pub inflight class AuthorizationError extends HttpException {
  new(message: str?) {
    super(http.HttpStatuses.FORBIDDEN, message);
  }
}

// 404 Not Found
pub inflight class NotFoundError extends HttpException {
  new(message: str?) {
    super(http.HttpStatuses.NOT_FOUND, message);
  }
}

// 405 Method Not Allowed
pub inflight class MethodNotAllowedError extends HttpException {
  new(message: str?) {
    super(http.HttpStatuses.METHOD_NOT_ALLOWED, message);
  }
}

// 410 Gone
pub inflight class GoneError extends HttpException {
  new(message: str?) {
    super(http.HttpStatuses.GONE, message);
  }
}

// 500 Internal Server Error
pub inflight class InternalServerError extends HttpException {
  new(message: str?) {
    super(http.HttpStatuses.INTERNAL_SERVER_ERROR, message);
  }
}

// 501 Not Implemented
pub inflight class NotImplementedError extends HttpException {
  new(message: str?) {
    super(http.HttpStatuses.NOT_IMPLEMENTED, message);
  }
}

// 502 Bad Gateway
pub inflight class BadGatewayError extends HttpException {
  new(message: str?) {
    super(http.HttpStatuses.BAD_GATEWAY, message);
  }
}

// 503 Service Unavailable
pub inflight class ServiceUnavailableError extends HttpException {
  new(message: str?) {
    super(http.HttpStatuses.SERVICE_UNAVAILABLE, message);
  }
}
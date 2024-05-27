bring expect;
bring "./httpStatus.w" as sut;

test "Transform HttpStatusEnum.Continue to str" {
  let status = sut.HttpStatuses.CONTINUE;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Continue");
}

test "Transform HttpStatusEnum.SwitchingProtocols to str" {
  let status = sut.HttpStatuses.SWITCHING_PROTOCOLS;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Switching Protocols");
}

test "Transform HttpStatusEnum.Processing to str" {
  let status = sut.HttpStatuses.PROCESSING;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Processing");
}

test "Transform HttpStatusEnum.EarlyHints to str" {
  let status = sut.HttpStatuses.EARLY_HINTS;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Early Hints");
}

test "Transform HttpStatusEnum.OK to str" {
  let status = sut.HttpStatuses.OK;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "OK");
}

test "Transform HttpStatusEnum.Created to str" {
  let status = sut.HttpStatuses.CREATED;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Created");
}

test "Transform HttpStatusEnum.Accepted to str" {
  let status = sut.HttpStatuses.ACCEPTED;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Accepted");
}

test "Transform HttpStatusEnum.NonAuthoritativeInformation to str" {
  let status = sut.HttpStatuses.NON_AUTHORITATIVE_INFORMATION;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Non-Authoritative Information");
}

test "Transform HttpStatusEnum.NoContent to str" {
  let status = sut.HttpStatuses.NO_CONTENT;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "No Content");
}

test "Transform HttpStatusEnum.ResetContent to str" {
  let status = sut.HttpStatuses.RESET_CONTENT;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Reset Content");
}

test "Transform HttpStatusEnum.PartialContent to str" {
  let status = sut.HttpStatuses.PARTIAL_CONTENT;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Partial Content");
}

test "Transform HttpStatusEnum.MultiStatus to str" {
  let status = sut.HttpStatuses.MULTI_STATUS;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Multi-Status");
}

test "Transform HttpStatusEnum.AlreadyReported to str" {
  let status = sut.HttpStatuses.ALREADY_REPORTED;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Already Reported");
}

test "Transform HttpStatusEnum.IMUsed to str" {
  let status = sut.HttpStatuses.IM_USED;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "IM Used");
}

test "Transform HttpStatusEnum.MultipleChoices to str" {
  let status = sut.HttpStatuses.MULTIPLE_CHOICES;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Multiple Choices");
}

test "Transform HttpStatusEnum.MovedPermanently to str" {
  let status = sut.HttpStatuses.MOVED_PERMANENTLY;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Moved Permanently");
}

test "Transform HttpStatusEnum.Found to str" {
  let status = sut.HttpStatuses.FOUND;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Found");
}

test "Transform HttpStatusEnum.SeeOther to str" {
  let status = sut.HttpStatuses.SEE_OTHER;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "See Other");
}

test "Transform HttpStatusEnum.NotModified to str" {
  let status = sut.HttpStatuses.NOT_MODIFIED;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Not Modified");
}

test "Transform HttpStatusEnum.UseProxy to str" {
  let status = sut.HttpStatuses.USE_PROXY;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Use Proxy");
}

test "Transform HttpStatusEnum.SwitchProxy to str" {
  let status = sut.HttpStatuses.SWITCH_PROXY;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Switch Proxy");
}

test "Transform HttpStatusEnum.TemporaryRedirect to str" {
  let status = sut.HttpStatuses.TEMPORARY_REDIRECT;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Temporary Redirect");
}

test "Transform HttpStatusEnum.PermanentRedirect to str" {
  let status = sut.HttpStatuses.PERMANENT_REDIRECT;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Permanent Redirect");
}

test "Transform HttpStatusEnum.BadRequest to str" {
  let status = sut.HttpStatuses.BAD_REQUEST;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Bad Request");
}

test "Transform HttpStatusEnum.Unauthorized to str" {
  let status = sut.HttpStatuses.UNAUTHORIZED;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Unauthorized");
}

test "Transform HttpStatusEnum.PaymentRequired to str" {
  let status = sut.HttpStatuses.PAYMENT_REQUIRED;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Payment Required");
}

test "Transform HttpStatusEnum.Forbidden to str" {
  let status = sut.HttpStatuses.FORBIDDEN;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Forbidden");
}

test "Transform HttpStatusEnum.NotFound to str" {
  let status = sut.HttpStatuses.NOT_FOUND;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Not Found");
}

test "Transform HttpStatusEnum.MethodNotAllowed to str" {
  let status = sut.HttpStatuses.METHOD_NOT_ALLOWED;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Method Not Allowed");
}

test "Transform HttpStatusEnum.NotAcceptable to str" {
  let status = sut.HttpStatuses.NOT_ACCEPTABLE;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Not Acceptable");
}

test "Transform HttpStatusEnum.ProxyAuthenticationRequired to str" {
  let status = sut.HttpStatuses.PROXY_AUTHENTICATION_REQUIRED;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Proxy Authentication Required");
}

test "Transform HttpStatusEnum.RequestTimeout to str" {
  let status = sut.HttpStatuses.REQUEST_TIMEOUT;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Request Timeout");
}

test "Transform HttpStatusEnum.Conflict to str" {
  let status = sut.HttpStatuses.CONFLICT;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Conflict");
}

test "Transform HttpStatusEnum.Gone to str" {
  let status = sut.HttpStatuses.GONE;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Gone");
}

test "Transform HttpStatusEnum.LengthRequired to str" {
  let status = sut.HttpStatuses.LENGTH_REQUIRED;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Length Required");
}

test "Transform HttpStatusEnum.PreconditionFailed to str" {
  let status = sut.HttpStatuses.PRECONDITION_FAILED;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Precondition Failed");
}

test "Transform HttpStatusEnum.PayloadTooLarge to str" {
  let status = sut.HttpStatuses.PAYLOAD_TOO_LARGE;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Payload Too Large");
}

test "Transform HttpStatusEnum.URITooLong to str" {
  let status = sut.HttpStatuses.URI_TOO_LONG;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "URI Too Long");
}

test "Transform HttpStatusEnum.UnsupportedMediaType to str" {
  let status = sut.HttpStatuses.UNSUPPORTED_MEDIA_TYPE;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Unsupported Media Type");
}

test "Transform HttpStatusEnum.RangeNotSatisfiable to str" {
  let status = sut.HttpStatuses.RANGE_NOT_SATISFIABLE;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Range Not Satisfiable");
}

test "Transform HttpStatusEnum.ExpectationFailed to str" {
  let status = sut.HttpStatuses.EXPECTATION_FAILED;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Expectation Failed");
}

test "Transform HttpStatusEnum.IMATeapot to str" {
  let status = sut.HttpStatuses.I_M_A_TEAPOT;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "I'm a teapot");
}

test "Transform HttpStatusEnum.MisdirectedRequest to str" {
  let status = sut.HttpStatuses.MISDIRECTED_REQUEST;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Misdirected Request");
}

test "Transform HttpStatusEnum.UnprocessableEntity to str" {
  let status = sut.HttpStatuses.UNPROCESSABLE_ENTITY;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Unprocessable Entity");
}

test "Transform HttpStatusEnum.Locked to str" {
  let status = sut.HttpStatuses.LOCKED;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Locked");
}

test "Transform HttpStatusEnum.FailedDependency to str" {
  let status = sut.HttpStatuses.FAILED_DEPENDENCY;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Failed Dependency");
}

test "Transform HttpStatusEnum.TooEarly to str" {
  let status = sut.HttpStatuses.TOO_EARLY;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Too Early");
}

test "Transform HttpStatusEnum.UpgradeRequired to str" {
  let status = sut.HttpStatuses.UPGRADE_REQUIRED;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Upgrade Required");
}

test "Transform HttpStatusEnum.PreconditionRequired to str" {
  let status = sut.HttpStatuses.PRECONDITION_REQUIRED;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Precondition Required");
}

test "Transform HttpStatusEnum.TooManyRequests to str" {
  let status = sut.HttpStatuses.TOO_MANY_REQUESTS;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Too Many Requests");
}

test "Transform HttpStatusEnum.RequestHeaderFieldsTooLarge to str" {
  let status = sut.HttpStatuses.REQUEST_HEADER_FIELDS_TOO_LARGE;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Request Header Fields Too Large");
}

test "Transform HttpStatusEnum.UnavailableForLegalReasons to str" {
  let status = sut.HttpStatuses.UNAVAILABLE_FOR_LEGAL_REASONS;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Unavailable For Legal Reasons");
}

test "Transform HttpStatusEnum.InternalServerError to str" {
  let status = sut.HttpStatuses.INTERNAL_SERVER_ERROR;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Internal Server Error");
}

test "Transform HttpStatusEnum.NotImplemented to str" {
  let status = sut.HttpStatuses.NOT_IMPLEMENTED;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Not Implemented");
}

test "Transform HttpStatusEnum.BadGateway to str" {
  let status = sut.HttpStatuses.BAD_GATEWAY;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Bad Gateway");
}

test "Transform HttpStatusEnum.ServiceUnavailable to str" {
  let status = sut.HttpStatuses.SERVICE_UNAVAILABLE;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Service Unavailable");
}

test "Transform HttpStatusEnum.GatewayTimeout to str" {
  let status = sut.HttpStatuses.GATEWAY_TIMEOUT;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Gateway Timeout");
}

test "Transform HttpStatusEnum.HTTPVersionNotSupported to str" {
  let status = sut.HttpStatuses.HTTP_VERSION_NOT_SUPPORTED;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "HTTP Version Not Supported");
}

test "Transform HttpStatusEnum.VariantAlsoNegotiates to str" {
  let status = sut.HttpStatuses.VARIANT_ALSO_NEGOTIATES;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Variant Also Negotiates");
}

test "Transform HttpStatusEnum.InsufficientStorage to str" {
  let status = sut.HttpStatuses.INSUFFICIENT_STORAGE;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Insufficient Storage");
}

test "Transform HttpStatusEnum.LoopDetected to str" {
  let status = sut.HttpStatuses.LOOP_DETECTED;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Loop Detected");
}

test "Transform HttpStatusEnum.NotExtended to str" {
  let status = sut.HttpStatuses.NOT_EXTENDED;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Not Extended");
}

test "Transform HttpStatusEnum.NetworkAuthenticationRequired to str" {
  let status = sut.HttpStatuses.NETWORK_AUTHENTICATION_REQUIRED;

  let actual = sut.HttpStatusTransformer.toStr(status);

  expect.equal(actual, "Network Authentication Required");
}

// Testing toStatusEnum

test "Transforms statusCode=100 to HttpStatusEnum.CONTINUE" {
  let status = sut.HttpStatusTransformer.toStatusEnum(100);

  expect.equal(status, sut.HttpStatuses.CONTINUE);
}

test "Transforms statusCode=101 to HttpStatusEnum.SWITCHING_PROTOCOLS" {
  let status = sut.HttpStatusTransformer.toStatusEnum(101);

  expect.equal(status, sut.HttpStatuses.SWITCHING_PROTOCOLS);
}

test "Transforms statusCode=102 to HttpStatusEnum.PROCESSING" {
  let status = sut.HttpStatusTransformer.toStatusEnum(102);

  expect.equal(status, sut.HttpStatuses.PROCESSING);
}

test "Transforms statusCode=103 to HttpStatusEnum.EARLY_HINTS" {
  let status = sut.HttpStatusTransformer.toStatusEnum(103);

  expect.equal(status, sut.HttpStatuses.EARLY_HINTS);
}

test "Transforms statusCode=200 to HttpStatusEnum.OK" {
  let status = sut.HttpStatusTransformer.toStatusEnum(200);

  expect.equal(status, sut.HttpStatuses.OK);
}

test "Transforms statusCode=201 to HttpStatusEnum.CREATED" {
  let status = sut.HttpStatusTransformer.toStatusEnum(201);

  expect.equal(status, sut.HttpStatuses.CREATED);
}

test "Transforms statusCode=202 to HttpStatusEnum.ACCEPTED" {
  let status = sut.HttpStatusTransformer.toStatusEnum(202);

  expect.equal(status, sut.HttpStatuses.ACCEPTED);
}

test "Transforms statusCode=203 to HttpStatusEnum.NON_AUTHORITATIVE_INFORMATION" {
  let status = sut.HttpStatusTransformer.toStatusEnum(203);

  expect.equal(status, sut.HttpStatuses.NON_AUTHORITATIVE_INFORMATION);
}

test "Transforms statusCode=204 to HttpStatusEnum.NO_CONTENT" {
  let status = sut.HttpStatusTransformer.toStatusEnum(204);

  expect.equal(status, sut.HttpStatuses.NO_CONTENT);
}

test "Transforms statusCode=205 to HttpStatusEnum.RESET_CONTENT" {
  let status = sut.HttpStatusTransformer.toStatusEnum(205);

  expect.equal(status, sut.HttpStatuses.RESET_CONTENT);
}

test "Transforms statusCode=206 to HttpStatusEnum.PARTIAL_CONTENT" {
  let status = sut.HttpStatusTransformer.toStatusEnum(206);

  expect.equal(status, sut.HttpStatuses.PARTIAL_CONTENT);
}

test "Transforms statusCode=207 to HttpStatusEnum.MULTI_STATUS" {
  let status = sut.HttpStatusTransformer.toStatusEnum(207);

  expect.equal(status, sut.HttpStatuses.MULTI_STATUS);
}

test "Transforms statusCode=208 to HttpStatusEnum.ALREADY_REPORTED" {
  let status = sut.HttpStatusTransformer.toStatusEnum(208);

  expect.equal(status, sut.HttpStatuses.ALREADY_REPORTED);
}

test "Transforms statusCode=226 to HttpStatusEnum.IM_USED" {
  let status = sut.HttpStatusTransformer.toStatusEnum(226);

  expect.equal(status, sut.HttpStatuses.IM_USED);
}

test "Transforms statusCode=300 to HttpStatusEnum.MULTIPLE_CHOICES" {
  let status = sut.HttpStatusTransformer.toStatusEnum(300);

  expect.equal(status, sut.HttpStatuses.MULTIPLE_CHOICES);
}

test "Transforms statusCode=301 to HttpStatusEnum.MOVED_PERMANENTLY" {
  let status = sut.HttpStatusTransformer.toStatusEnum(301);

  expect.equal(status, sut.HttpStatuses.MOVED_PERMANENTLY);
}

test "Transforms statusCode=302 to HttpStatusEnum.FOUND" {
  let status = sut.HttpStatusTransformer.toStatusEnum(302);

  expect.equal(status, sut.HttpStatuses.FOUND);
}

test "Transforms statusCode=303 to HttpStatusEnum.SEE_OTHER" {
  let status = sut.HttpStatusTransformer.toStatusEnum(303);

  expect.equal(status, sut.HttpStatuses.SEE_OTHER);
}

test "Transforms statusCode=304 to HttpStatusEnum.NOT_MODIFIED" {
  let status = sut.HttpStatusTransformer.toStatusEnum(304);

  expect.equal(status, sut.HttpStatuses.NOT_MODIFIED);
}

test "Transforms statusCode=305 to HttpStatusEnum.USE_PROXY" {
  let status = sut.HttpStatusTransformer.toStatusEnum(305);

  expect.equal(status, sut.HttpStatuses.USE_PROXY);
}

test "Transforms statusCode=307 to HttpStatusEnum.TEMPORARY_REDIRECT" {
  let status = sut.HttpStatusTransformer.toStatusEnum(307);

  expect.equal(status, sut.HttpStatuses.TEMPORARY_REDIRECT);
}

test "Transforms statusCode=308 to HttpStatusEnum.PERMANENT_REDIRECT" {
  let status = sut.HttpStatusTransformer.toStatusEnum(308);

  expect.equal(status, sut.HttpStatuses.PERMANENT_REDIRECT);
}

test "Transforms statusCode=400 to HttpStatusEnum.BAD_REQUEST" {
  let status = sut.HttpStatusTransformer.toStatusEnum(400);

  expect.equal(status, sut.HttpStatuses.BAD_REQUEST);
}

test "Transforms statusCode=401 to HttpStatusEnum.UNAUTHORIZED" {
  let status = sut.HttpStatusTransformer.toStatusEnum(401);

  expect.equal(status, sut.HttpStatuses.UNAUTHORIZED);
}

test "Transforms statusCode=402 to HttpStatusEnum.PAYMENT_REQUIRED" {
  let status = sut.HttpStatusTransformer.toStatusEnum(402);

  expect.equal(status, sut.HttpStatuses.PAYMENT_REQUIRED);
}

test "Transforms statusCode=403 to HttpStatusEnum.FORBIDDEN" {
  let status = sut.HttpStatusTransformer.toStatusEnum(403);

  expect.equal(status, sut.HttpStatuses.FORBIDDEN);
}

test "Transforms statusCode=404 to HttpStatusEnum.NOT_FOUND" {
  let status = sut.HttpStatusTransformer.toStatusEnum(404);

  expect.equal(status, sut.HttpStatuses.NOT_FOUND);
}

test "Transforms statusCode=405 to HttpStatusEnum.METHOD_NOT_ALLOWED" {
  let status = sut.HttpStatusTransformer.toStatusEnum(405);

  expect.equal(status, sut.HttpStatuses.METHOD_NOT_ALLOWED);
}

test "Transforms statusCode=406 to HttpStatusEnum.NOT_ACCEPTABLE" {
  let status = sut.HttpStatusTransformer.toStatusEnum(406);

  expect.equal(status, sut.HttpStatuses.NOT_ACCEPTABLE);
}

test "Transforms statusCode=407 to HttpStatusEnum.PROXY_AUTHENTICATION_REQUIRED" {
  let status = sut.HttpStatusTransformer.toStatusEnum(407);

  expect.equal(status, sut.HttpStatuses.PROXY_AUTHENTICATION_REQUIRED);
}

test "Transforms statusCode=408 to HttpStatusEnum.REQUEST_TIMEOUT" {
  let status = sut.HttpStatusTransformer.toStatusEnum(408);

  expect.equal(status, sut.HttpStatuses.REQUEST_TIMEOUT);
}

test "Transforms statusCode=409 to HttpStatusEnum.CONFLICT" {
  let status = sut.HttpStatusTransformer.toStatusEnum(409);

  expect.equal(status, sut.HttpStatuses.CONFLICT);
}

test "Transforms statusCode=410 to HttpStatusEnum.GONE" {
  let status = sut.HttpStatusTransformer.toStatusEnum(410);

  expect.equal(status, sut.HttpStatuses.GONE);
}

test "Transforms statusCode=411 to HttpStatusEnum.LENGTH_REQUIRED" {
  let status = sut.HttpStatusTransformer.toStatusEnum(411);

  expect.equal(status, sut.HttpStatuses.LENGTH_REQUIRED);
}

test "Transforms statusCode=412 to HttpStatusEnum.PRECONDITION_FAILED" {
  let status = sut.HttpStatusTransformer.toStatusEnum(412);

  expect.equal(status, sut.HttpStatuses.PRECONDITION_FAILED);
}

test "Transforms statusCode=413 to HttpStatusEnum.PAYLOAD_TOO_LARGE" {
  let status = sut.HttpStatusTransformer.toStatusEnum(413);

  expect.equal(status, sut.HttpStatuses.PAYLOAD_TOO_LARGE);
}

test "Transforms statusCode=414 to HttpStatusEnum.URI_TOO_LONG" {
  let status = sut.HttpStatusTransformer.toStatusEnum(414);

  expect.equal(status, sut.HttpStatuses.URI_TOO_LONG);
}

test "Transforms statusCode=415 to HttpStatusEnum.UNSUPPORTED_MEDIA_TYPE" {
  let status = sut.HttpStatusTransformer.toStatusEnum(415);

  expect.equal(status, sut.HttpStatuses.UNSUPPORTED_MEDIA_TYPE);
}

test "Transforms statusCode=416 to HttpStatusEnum.RANGE_NOT_SATISFIABLE" {
  let status = sut.HttpStatusTransformer.toStatusEnum(416);

  expect.equal(status, sut.HttpStatuses.RANGE_NOT_SATISFIABLE);
}

test "Transforms statusCode=417 to HttpStatusEnum.EXPECTATION_FAILED" {
  let status = sut.HttpStatusTransformer.toStatusEnum(417);

  expect.equal(status, sut.HttpStatuses.EXPECTATION_FAILED);
}

test "Transforms statusCode=418 to HttpStatusEnum.I_M_A_TEAPOT" {
  let status = sut.HttpStatusTransformer.toStatusEnum(418);

  expect.equal(status, sut.HttpStatuses.I_M_A_TEAPOT);
}

test "Transforms statusCode=421 to HttpStatusEnum.MISDIRECTED_REQUEST" {
  let status = sut.HttpStatusTransformer.toStatusEnum(421);

  expect.equal(status, sut.HttpStatuses.MISDIRECTED_REQUEST);
}

test "Transforms statusCode=422 to HttpStatusEnum.UNPROCESSABLE_ENTITY" {
  let status = sut.HttpStatusTransformer.toStatusEnum(422);

  expect.equal(status, sut.HttpStatuses.UNPROCESSABLE_ENTITY);
}

test "Transforms statusCode=423 to HttpStatusEnum.LOCKED" {
  let status = sut.HttpStatusTransformer.toStatusEnum(423);

  expect.equal(status, sut.HttpStatuses.LOCKED);
}

test "Transforms statusCode=424 to HttpStatusEnum.FAILED_DEPENDENCY" {
  let status = sut.HttpStatusTransformer.toStatusEnum(424);

  expect.equal(status, sut.HttpStatuses.FAILED_DEPENDENCY);
}

test "Transforms statusCode=425 to HttpStatusEnum.TOO_EARLY" {
  let status = sut.HttpStatusTransformer.toStatusEnum(425);

  expect.equal(status, sut.HttpStatuses.TOO_EARLY);
}

test "Transforms statusCode=426 to HttpStatusEnum.UPGRADE_REQUIRED" {
  let status = sut.HttpStatusTransformer.toStatusEnum(426);

  expect.equal(status, sut.HttpStatuses.UPGRADE_REQUIRED);
}

test "Transforms statusCode=428 to HttpStatusEnum.PRECONDITION_REQUIRED" {
  let status = sut.HttpStatusTransformer.toStatusEnum(428);

  expect.equal(status, sut.HttpStatuses.PRECONDITION_REQUIRED);
}

test "Transforms statusCode=429 to HttpStatusEnum.TOO_MANY_REQUESTS" {
  let status = sut.HttpStatusTransformer.toStatusEnum(429);

  expect.equal(status, sut.HttpStatuses.TOO_MANY_REQUESTS);
}

test "Transforms statusCode=431 to HttpStatusEnum.REQUEST_HEADER_FIELDS_TOO_LARGE" {
  let status = sut.HttpStatusTransformer.toStatusEnum(431);

  expect.equal(status, sut.HttpStatuses.REQUEST_HEADER_FIELDS_TOO_LARGE);
}

test "Transforms statusCode=451 to HttpStatusEnum.UNAVAILABLE_FOR_LEGAL_REASONS" {
  let status = sut.HttpStatusTransformer.toStatusEnum(451);

  expect.equal(status, sut.HttpStatuses.UNAVAILABLE_FOR_LEGAL_REASONS);
}

test "Transforms statusCode=500 to HttpStatusEnum.INTERNAL_SERVER_ERROR" {
  let status = sut.HttpStatusTransformer.toStatusEnum(500);

  expect.equal(status, sut.HttpStatuses.INTERNAL_SERVER_ERROR);
}

test "Transforms statusCode=501 to HttpStatusEnum.NOT_IMPLEMENTED" {
  let status = sut.HttpStatusTransformer.toStatusEnum(501);

  expect.equal(status, sut.HttpStatuses.NOT_IMPLEMENTED);
}

test "Transforms statusCode=502 to HttpStatusEnum.BAD_GATEWAY" {
  let status = sut.HttpStatusTransformer.toStatusEnum(502);

  expect.equal(status, sut.HttpStatuses.BAD_GATEWAY);
}

test "Transforms statusCode=503 to HttpStatusEnum.SERVICE_UNAVAILABLE" {
  let status = sut.HttpStatusTransformer.toStatusEnum(503);

  expect.equal(status, sut.HttpStatuses.SERVICE_UNAVAILABLE);
}

test "Transforms statusCode=504 to HttpStatusEnum.GATEWAY_TIMEOUT" {
  let status = sut.HttpStatusTransformer.toStatusEnum(504);

  expect.equal(status, sut.HttpStatuses.GATEWAY_TIMEOUT);
}

test "Transforms statusCode=505 to HttpStatusEnum.HTTP_VERSION_NOT_SUPPORTED" {
  let status = sut.HttpStatusTransformer.toStatusEnum(505);

  expect.equal(status, sut.HttpStatuses.HTTP_VERSION_NOT_SUPPORTED);
}

test "Transforms statusCode=506 to HttpStatusEnum.VARIANT_ALSO_NEGOTIATES" {
  let status = sut.HttpStatusTransformer.toStatusEnum(506);

  expect.equal(status, sut.HttpStatuses.VARIANT_ALSO_NEGOTIATES);
}

test "Transforms statusCode=507 to HttpStatusEnum.INSUFFICIENT_STORAGE" {
  let status = sut.HttpStatusTransformer.toStatusEnum(507);

  expect.equal(status, sut.HttpStatuses.INSUFFICIENT_STORAGE);
}

test "Transforms statusCode=508 to HttpStatusEnum.LOOP_DETECTED" {
  let status = sut.HttpStatusTransformer.toStatusEnum(508);

  expect.equal(status, sut.HttpStatuses.LOOP_DETECTED);
}

test "Transforms statusCode=510 to HttpStatusEnum.NOT_EXTENDED" {
  let status = sut.HttpStatusTransformer.toStatusEnum(510);

  expect.equal(status, sut.HttpStatuses.NOT_EXTENDED);
}

test "Transforms statusCode=511 to HttpStatusEnum.NETWORK_AUTHENTICATION_REQUIRED" {
  let status = sut.HttpStatusTransformer.toStatusEnum(511);

  expect.equal(status, sut.HttpStatuses.NETWORK_AUTHENTICATION_REQUIRED);
}

test "Transforms any other statusCode to HttpStatusEnum.UNKNOWN" {
  let status = sut.HttpStatusTransformer.toStatusEnum(999);

  expect.equal(status, sut.HttpStatuses.UNKNOWN);
}

// Testing fromtStatusEnum

test "Transforms HttpStatusEnum.CONTINUE to HttpStatus" {
  let httpStatus = sut.HttpStatuses.CONTINUE;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 100);
  expect.equal(status.message, "Continue");
}

test "Transforms HttpStatusEnum.SWITCHING_PROTOCOLS to HttpStatus" {
  let httpStatus = sut.HttpStatuses.SWITCHING_PROTOCOLS;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 101);
  expect.equal(status.message, "Switching Protocols");
}

test "Transforms HttpStatusEnum.PROCESSING to HttpStatus" {
  let httpStatus = sut.HttpStatuses.PROCESSING;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 102);
  expect.equal(status.message, "Processing");
}

test "Transforms HttpStatusEnum.EARLY_HINTS to HttpStatus" {
  let httpStatus = sut.HttpStatuses.EARLY_HINTS;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 103);
  expect.equal(status.message, "Early Hints");
}

test "Transforms HttpStatusEnum.OK to HttpStatus" {
  let httpStatus = sut.HttpStatuses.OK;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 200);
  expect.equal(status.message, "OK");
}

test "Transforms HttpStatusEnum.CREATED to HttpStatus" {
  let httpStatus = sut.HttpStatuses.CREATED;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 201);
  expect.equal(status.message, "Created");
}

test "Transforms HttpStatusEnum.ACCEPTED to HttpStatus" {
  let httpStatus = sut.HttpStatuses.ACCEPTED;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 202);
  expect.equal(status.message, "Accepted");
}

test "Transforms HttpStatusEnum.NON_AUTHORITATIVE_INFORMATION to HttpStatus" {
  let httpStatus = sut.HttpStatuses.NON_AUTHORITATIVE_INFORMATION;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 203);
  expect.equal(status.message, "Non-Authoritative Information");
}

test "Transforms HttpStatusEnum.NO_CONTENT to HttpStatus" {
  let httpStatus = sut.HttpStatuses.NO_CONTENT;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 204);
  expect.equal(status.message, "No Content");
}

test "Transforms HttpStatusEnum.RESET_CONTENT to HttpStatus" {
  let httpStatus = sut.HttpStatuses.RESET_CONTENT;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 205);
  expect.equal(status.message, "Reset Content");
}

test "Transforms HttpStatusEnum.PARTIAL_CONTENT to HttpStatus" {
  let httpStatus = sut.HttpStatuses.PARTIAL_CONTENT;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 206);
  expect.equal(status.message, "Partial Content");
}

test "Transforms HttpStatusEnum.MULTI_STATUS to HttpStatus" {
  let httpStatus = sut.HttpStatuses.MULTI_STATUS;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 207);
  expect.equal(status.message, "Multi-Status");
}

test "Transforms HttpStatusEnum.ALREADY_REPORTED to HttpStatus" {
  let httpStatus = sut.HttpStatuses.ALREADY_REPORTED;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 208);
  expect.equal(status.message, "Already Reported");
}

test "Transforms HttpStatusEnum.IM_USED to HttpStatus" {
  let httpStatus = sut.HttpStatuses.IM_USED;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 226);
  expect.equal(status.message, "IM Used");
}

test "Transforms HttpStatusEnum.MULTIPLE_CHOICES to HttpStatus" {
  let httpStatus = sut.HttpStatuses.MULTIPLE_CHOICES;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 300);
  expect.equal(status.message, "Multiple Choices");
}

test "Transforms HttpStatusEnum.MOVED_PERMANENTLY to HttpStatus" {
  let httpStatus = sut.HttpStatuses.MOVED_PERMANENTLY;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 301);
  expect.equal(status.message, "Moved Permanently");
}

test "Transforms HttpStatusEnum.FOUND to HttpStatus" {
  let httpStatus = sut.HttpStatuses.FOUND;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 302);
  expect.equal(status.message, "Found");
}

test "Transforms HttpStatusEnum.SEE_OTHER to HttpStatus" {
  let httpStatus = sut.HttpStatuses.SEE_OTHER;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 303);
  expect.equal(status.message, "See Other");
}

test "Transforms HttpStatusEnum.NOT_MODIFIED to HttpStatus" {
  let httpStatus = sut.HttpStatuses.NOT_MODIFIED;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 304);
  expect.equal(status.message, "Not Modified");
}

test "Transforms HttpStatusEnum.USE_PROXY to HttpStatus" {
  let httpStatus = sut.HttpStatuses.USE_PROXY;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 305);
  expect.equal(status.message, "Use Proxy");
}

test "Transforms HttpStatusEnum.TEMPORARY_REDIRECT to HttpStatus" {
  let httpStatus = sut.HttpStatuses.TEMPORARY_REDIRECT;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 307);
  expect.equal(status.message, "Temporary Redirect");
}

test "Transforms HttpStatusEnum.PERMANENT_REDIRECT to HttpStatus" {
  let httpStatus = sut.HttpStatuses.PERMANENT_REDIRECT;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 308);
  expect.equal(status.message, "Permanent Redirect");
}

test "Transforms HttpStatusEnum.BAD_REQUEST to HttpStatus" {
  let httpStatus = sut.HttpStatuses.BAD_REQUEST;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 400);
  expect.equal(status.message, "Bad Request");
}

test "Transforms HttpStatusEnum.UNAUTHORIZED to HttpStatus" {
  let httpStatus = sut.HttpStatuses.UNAUTHORIZED;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 401);
  expect.equal(status.message, "Unauthorized");
}

test "Transforms HttpStatusEnum.PAYMENT_REQUIRED to HttpStatus" {
  let httpStatus = sut.HttpStatuses.PAYMENT_REQUIRED;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 402);
  expect.equal(status.message, "Payment Required");
}

test "Transforms HttpStatusEnum.FORBIDDEN to HttpStatus" {
  let httpStatus = sut.HttpStatuses.FORBIDDEN;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 403);
  expect.equal(status.message, "Forbidden");
}

test "Transforms HttpStatusEnum.NOT_FOUND to HttpStatus" {
  let httpStatus = sut.HttpStatuses.NOT_FOUND;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 404);
  expect.equal(status.message, "Not Found");
}

test "Transforms HttpStatusEnum.METHOD_NOT_ALLOWED to HttpStatus" {
  let httpStatus = sut.HttpStatuses.METHOD_NOT_ALLOWED;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 405);
  expect.equal(status.message, "Method Not Allowed");
}

test "Transforms HttpStatusEnum.NOT_ACCEPTABLE to HttpStatus" {
  let httpStatus = sut.HttpStatuses.NOT_ACCEPTABLE;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 406);
  expect.equal(status.message, "Not Acceptable");
}

test "Transforms HttpStatusEnum.PROXY_AUTHENTICATION_REQUIRED to HttpStatus" {
  let httpStatus = sut.HttpStatuses.PROXY_AUTHENTICATION_REQUIRED;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 407);
  expect.equal(status.message, "Proxy Authentication Required");
}

test "Transforms HttpStatusEnum.REQUEST_TIMEOUT to HttpStatus" {
  let httpStatus = sut.HttpStatuses.REQUEST_TIMEOUT;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 408);
  expect.equal(status.message, "Request Timeout");
}

test "Transforms HttpStatusEnum.CONFLICT to HttpStatus" {
  let httpStatus = sut.HttpStatuses.CONFLICT;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 409);
  expect.equal(status.message, "Conflict");
}

test "Transforms HttpStatusEnum.GONE to HttpStatus" {
  let httpStatus = sut.HttpStatuses.GONE;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 410);
  expect.equal(status.message, "Gone");
}

test "Transforms HttpStatusEnum.LENGTH_REQUIRED to HttpStatus" {
  let httpStatus = sut.HttpStatuses.LENGTH_REQUIRED;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 411);
  expect.equal(status.message, "Length Required");
}

test "Transforms HttpStatusEnum.PRECONDITION_FAILED to HttpStatus" {
  let httpStatus = sut.HttpStatuses.PRECONDITION_FAILED;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 412);
  expect.equal(status.message, "Precondition Failed");
}

test "Transforms HttpStatusEnum.PAYLOAD_TOO_LARGE to HttpStatus" {
  let httpStatus = sut.HttpStatuses.PAYLOAD_TOO_LARGE;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 413);
  expect.equal(status.message, "Payload Too Large");
}

test "Transforms HttpStatusEnum.URI_TOO_LONG to HttpStatus" {
  let httpStatus = sut.HttpStatuses.URI_TOO_LONG;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 414);
  expect.equal(status.message, "URI Too Long");
}

test "Transforms HttpStatusEnum.UNSUPPORTED_MEDIA_TYPE to HttpStatus" {
  let httpStatus = sut.HttpStatuses.UNSUPPORTED_MEDIA_TYPE;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 415);
  expect.equal(status.message, "Unsupported Media Type");
}

test "Transforms HttpStatusEnum.RANGE_NOT_SATISFIABLE to HttpStatus" {
  let httpStatus = sut.HttpStatuses.RANGE_NOT_SATISFIABLE;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 416);
  expect.equal(status.message, "Range Not Satisfiable");
}

test "Transforms HttpStatusEnum.EXPECTATION_FAILED to HttpStatus" {
  let httpStatus = sut.HttpStatuses.EXPECTATION_FAILED;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 417);
  expect.equal(status.message, "Expectation Failed");
}

test "Transforms HttpStatusEnum.I_M_A_TEAPOT to HttpStatus" {
  let httpStatus = sut.HttpStatuses.I_M_A_TEAPOT;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 418);
  expect.equal(status.message, "I'm a teapot");
}

test "Transforms HttpStatusEnum.MISDIRECTED_REQUEST to HttpStatus" {
  let httpStatus = sut.HttpStatuses.MISDIRECTED_REQUEST;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 421);
  expect.equal(status.message, "Misdirected Request");
}

test "Transforms HttpStatusEnum.UNPROCESSABLE_ENTITY to HttpStatus" {
  let httpStatus = sut.HttpStatuses.UNPROCESSABLE_ENTITY;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 422);
  expect.equal(status.message, "Unprocessable Entity");
}

test "Transforms HttpStatusEnum.LOCKED to HttpStatus" {
  let httpStatus = sut.HttpStatuses.LOCKED;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 423);
  expect.equal(status.message, "Locked");
}

test "Transforms HttpStatusEnum.FAILED_DEPENDENCY to HttpStatus" {
  let httpStatus = sut.HttpStatuses.FAILED_DEPENDENCY;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 424);
  expect.equal(status.message, "Failed Dependency");
}

test "Transforms HttpStatusEnum.TOO_EARLY to HttpStatus" {
  let httpStatus = sut.HttpStatuses.TOO_EARLY;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 425);
  expect.equal(status.message, "Too Early");
}

test "Transforms HttpStatusEnum.UPGRADE_REQUIRED to HttpStatus" {
  let httpStatus = sut.HttpStatuses.UPGRADE_REQUIRED;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 426);
  expect.equal(status.message, "Upgrade Required");
}

test "Transforms HttpStatusEnum.PRECONDITION_REQUIRED to HttpStatus" {
  let httpStatus = sut.HttpStatuses.PRECONDITION_REQUIRED;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 428);
  expect.equal(status.message, "Precondition Required");
}

test "Transforms HttpStatusEnum.TOO_MANY_REQUESTS to HttpStatus" {
  let httpStatus = sut.HttpStatuses.TOO_MANY_REQUESTS;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 429);
  expect.equal(status.message, "Too Many Requests");
}

test "Transforms HttpStatusEnum.REQUEST_HEADER_FIELDS_TOO_LARGE to HttpStatus" {
  let httpStatus = sut.HttpStatuses.REQUEST_HEADER_FIELDS_TOO_LARGE;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 431);
  expect.equal(status.message, "Request Header Fields Too Large");
}

test "Transforms HttpStatusEnum.UNAVAILABLE_FOR_LEGAL_REASONS to HttpStatus" {
  let httpStatus = sut.HttpStatuses.UNAVAILABLE_FOR_LEGAL_REASONS;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 451);
  expect.equal(status.message, "Unavailable For Legal Reasons");
}

test "Transforms HttpStatusEnum.INTERNAL_SERVER_ERROR to HttpStatus" {
  let httpStatus = sut.HttpStatuses.INTERNAL_SERVER_ERROR;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 500);
  expect.equal(status.message, "Internal Server Error");
}

test "Transforms HttpStatusEnum.NOT_IMPLEMENTED to HttpStatus" {
  let httpStatus = sut.HttpStatuses.NOT_IMPLEMENTED;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 501);
  expect.equal(status.message, "Not Implemented");
}

test "Transforms HttpStatusEnum.BAD_GATEWAY to HttpStatus" {
  let httpStatus = sut.HttpStatuses.BAD_GATEWAY;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 502);
  expect.equal(status.message, "Bad Gateway");
}

test "Transforms HttpStatusEnum.SERVICE_UNAVAILABLE to HttpStatus" {
  let httpStatus = sut.HttpStatuses.SERVICE_UNAVAILABLE;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 503);
  expect.equal(status.message, "Service Unavailable");
}

test "Transforms HttpStatusEnum.GATEWAY_TIMEOUT to HttpStatus" {
  let httpStatus = sut.HttpStatuses.GATEWAY_TIMEOUT;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 504);
  expect.equal(status.message, "Gateway Timeout");
}

test "Transforms HttpStatusEnum.HTTP_VERSION_NOT_SUPPORTED to HttpStatus" {
  let httpStatus = sut.HttpStatuses.HTTP_VERSION_NOT_SUPPORTED;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 505);
  expect.equal(status.message, "HTTP Version Not Supported");
}

test "Transforms HttpStatusEnum.VARIANT_ALSO_NEGOTIATES to HttpStatus" {
  let httpStatus = sut.HttpStatuses.VARIANT_ALSO_NEGOTIATES;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 506);
  expect.equal(status.message, "Variant Also Negotiates");
}

test "Transforms HttpStatusEnum.INSUFFICIENT_STORAGE to HttpStatus" {
  let httpStatus = sut.HttpStatuses.INSUFFICIENT_STORAGE;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 507);
  expect.equal(status.message, "Insufficient Storage");
}

test "Transforms HttpStatusEnum.LOOP_DETECTED to HttpStatus" {
  let httpStatus = sut.HttpStatuses.LOOP_DETECTED;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 508);
  expect.equal(status.message, "Loop Detected");
}

test "Transforms HttpStatusEnum.NOT_EXTENDED to HttpStatus" {
  let httpStatus = sut.HttpStatuses.NOT_EXTENDED;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 510);
  expect.equal(status.message, "Not Extended");
}

test "Transforms HttpStatusEnum.NETWORK_AUTHENTICATION_REQUIRED to HttpStatus" {
  let httpStatus = sut.HttpStatuses.NETWORK_AUTHENTICATION_REQUIRED;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 511);
  expect.equal(status.message, "Network Authentication Required");
}

test "Transforms any other to HttpStatus" {
  let httpStatus = sut.HttpStatuses.UNKNOWN;

  let status = sut.HttpStatusTransformer.fromStatusEnum(httpStatus);

  expect.equal(status.code, 999);
  expect.equal(status.message, "Galaxy Express 999");
}
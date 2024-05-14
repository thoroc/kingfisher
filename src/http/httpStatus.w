// 100 Continue
// 101 Switching Protocols
// 102 Processing
// 103 Early Hints
// 200 OK
// 201 Created
// 202 Accepted
// 203 Non-Authoritative Information
// 204 No Content
// 205 Reset Content
// 206 Partial Content
// 207 Multi-Status
// 208 Already Reported
// 226 IM Used
// 300 Multiple Choices
// 301 Moved Permanently
// 302 Found
// 303 See Other
// 304 Not Modified
// 305 Use Proxy
// 306 Switch Proxy
// 307 Temporary Redirect
// 308 Permanent Redirect
// 400 Bad Request
// 401 Unauthorized
// 402 Payment Required
// 403 Forbidden
// 404 Not Found
// 405 Method Not Allowed
// 406 Not Acceptable
// 407 Proxy Authentication Required
// 408 Request Timeout
// 409 Conflict
// 410 Gone
// 411 Length Required
// 412 Precondition Failed
// 413 Payload Too Large
// 414 URI Too Long
// 415 Unsupported Media Type
// 416 Range Not Satisfiable
// 417 Expectation Failed
// 418 I'm a teapot
// 421 Misdirected Request
// 422 Unprocessable Entity
// 423 Locked
// 424 Failed Dependency
// 425 Too Early
// 426 Upgrade Required
// 428 Precondition Required
// 429 Too Many Requests
// 431 Request Header Fields Too Large
// 451 Unavailable For Legal Reasons
// 500 Internal Server Error
// 501 Not Implemented
// 502 Bad Gateway
// 503 Service Unavailable
// 504 Gateway Timeout
// 505 HTTP Version Not Supported
// 506 Variant Also Negotiates
// 507 Insufficient Storage
// 508 Loop Detected
// 510 Not Extended
// 511 Network Authentication Required

pub enum HttpStatuses {
  CONTINUE,
  SWITCHING_PROTOCOLS,
  PROCESSING,
  EARLY_HINTS,
  OK,
  CREATED,
  ACCEPTED,
  NON_AUTHORITATIVE_INFORMATION,
  NO_CONTENT,
  RESET_CONTENT,
  PARTIAL_CONTENT,
  MULTI_STATUS,
  ALREADY_REPORTED,
  IM_USED,
  MULTIPLE_CHOICES,
  MOVED_PERMANENTLY,
  FOUND,
  SEE_OTHER,
  NOT_MODIFIED,
  USE_PROXY,
  SWITCH_PROXY,
  TEMPORARY_REDIRECT,
  PERMANENT_REDIRECT,
  BAD_REQUEST,
  UNAUTHORIZED,
  PAYMENT_REQUIRED,
  FORBIDDEN,
  NOT_FOUND,
  METHOD_NOT_ALLOWED,
  NOT_ACCEPTABLE,
  PROXY_AUTHENTICATION_REQUIRED,
  REQUEST_TIMEOUT,
  CONFLICT,
  GONE,
  LENGTH_REQUIRED,
  PRECONDITION_FAILED,
  PAYLOAD_TOO_LARGE,
  URI_TOO_LONG,
  UNSUPPORTED_MEDIA_TYPE,
  RANGE_NOT_SATISFIABLE,
  EXPECTATION_FAILED,
  I_M_A_TEAPOT,
  MISDIRECTED_REQUEST,
  UNPROCESSABLE_ENTITY,
  LOCKED,
  FAILED_DEPENDENCY,
  TOO_EARLY,
  UPGRADE_REQUIRED,
  PRECONDITION_REQUIRED,
  TOO_MANY_REQUESTS,
  REQUEST_HEADER_FIELDS_TOO_LARGE,
  UNAVAILABLE_FOR_LEGAL_REASONS,
  INTERNAL_SERVER_ERROR,
  NOT_IMPLEMENTED,
  BAD_GATEWAY,
  SERVICE_UNAVAILABLE,
  GATEWAY_TIMEOUT,
  HTTP_VERSION_NOT_SUPPORTED,
  VARIANT_ALSO_NEGOTIATES,
  INSUFFICIENT_STORAGE,
  LOOP_DETECTED,
  NOT_EXTENDED,
  NETWORK_AUTHENTICATION_REQUIRED,
}

pub struct HttpStatus {
  code: num;
  message: str;
}

pub class HttpStatusTransformer {
  pub static inflight toStatusEnum(code: num): HttpStatuses {
    if code == 100 {
      return HttpStatuses.CONTINUE;
    } elif code == 101 {
      return HttpStatuses.SWITCHING_PROTOCOLS;
    } elif code == 102 {
      return HttpStatuses.PROCESSING;
    } elif code == 103 {
      return HttpStatuses.EARLY_HINTS;
    } elif code == 200 {
      return HttpStatuses.OK;
    } elif code == 201 {
      return HttpStatuses.CREATED;
    } elif code == 202 {
      return HttpStatuses.ACCEPTED;
    } elif code == 203 {
      return HttpStatuses.NON_AUTHORITATIVE_INFORMATION;
    } elif code == 204 {
      return HttpStatuses.NO_CONTENT;
    } elif code == 205 {
      return HttpStatuses.RESET_CONTENT;
    } elif code == 206 {
      return HttpStatuses.PARTIAL_CONTENT;
    } elif code == 207 {
      return HttpStatuses.MULTI_STATUS;
    } elif code == 208 {
      return HttpStatuses.ALREADY_REPORTED;
    } elif code == 226 {
      return HttpStatuses.IM_USED;
    } elif code == 300 {
      return HttpStatuses.MULTIPLE_CHOICES;
    } elif code == 301 {
      return HttpStatuses.MOVED_PERMANENTLY;
    } elif code == 302 {
      return HttpStatuses.FOUND;
    } elif code == 303 {
      return HttpStatuses.SEE_OTHER;
    } elif code == 304 {
      return HttpStatuses.NOT_MODIFIED;
    } elif code == 305 {
      return HttpStatuses.USE_PROXY;
    } elif code == 306 {
      return HttpStatuses.SWITCH_PROXY;
    } elif code == 307 {
      return HttpStatuses.TEMPORARY_REDIRECT;
    } elif code == 308 {
      return HttpStatuses.PERMANENT_REDIRECT;
    } elif code == 400 {
      return HttpStatuses.BAD_REQUEST;
    } elif code == 401 {
      return HttpStatuses.UNAUTHORIZED;
    } elif code == 402 {
      return HttpStatuses.PAYMENT_REQUIRED;
    } elif code == 403 {
      return HttpStatuses.FORBIDDEN;
    } elif code == 404 {
      return HttpStatuses.NOT_FOUND;
    } elif code == 405 {
      return HttpStatuses.METHOD_NOT_ALLOWED;
    } elif code == 406 {
      return HttpStatuses.NOT_ACCEPTABLE;
    } elif code == 407 {
      return HttpStatuses.PROXY_AUTHENTICATION_REQUIRED;
    } elif code == 408 {
      return HttpStatuses.REQUEST_TIMEOUT;
    } elif code == 409 {
      return HttpStatuses.CONFLICT;
    } elif code == 410 {
      return HttpStatuses.GONE;
    } elif code == 411 {
      return HttpStatuses.LENGTH_REQUIRED;
    } elif code == 412 {
      return HttpStatuses.PRECONDITION_FAILED;
    } elif code == 413 {
      return HttpStatuses.PAYLOAD_TOO_LARGE;
    } elif code == 414 {
      return HttpStatuses.URI_TOO_LONG;
    } elif code == 415 {
      return HttpStatuses.UNSUPPORTED_MEDIA_TYPE;
    } elif code == 416 {
      return HttpStatuses.RANGE_NOT_SATISFIABLE;
    } elif code == 417 {
      return HttpStatuses.EXPECTATION_FAILED;
    } elif code == 418 {
      return HttpStatuses.I_M_A_TEAPOT;
    } elif code == 421 {
      return HttpStatuses.MISDIRECTED_REQUEST;
    } elif code == 422 {
      return HttpStatuses.UNPROCESSABLE_ENTITY;
    } elif code == 423 {
      return HttpStatuses.LOCKED;
    } elif code == 424 {
      return HttpStatuses.FAILED_DEPENDENCY;
    } elif code == 425 {
      return HttpStatuses.TOO_EARLY;
    } elif code == 426 {
      return HttpStatuses.UPGRADE_REQUIRED;
    } elif code == 428 {
      return HttpStatuses.PRECONDITION_REQUIRED;
    } elif code == 429 {
      return HttpStatuses.TOO_MANY_REQUESTS;
    } elif code == 431 {
      return HttpStatuses.REQUEST_HEADER_FIELDS_TOO_LARGE;
    } elif code == 451 {
      return HttpStatuses.UNAVAILABLE_FOR_LEGAL_REASONS;
    } elif code == 500 {
      return HttpStatuses.INTERNAL_SERVER_ERROR;
    } elif code == 501 {
      return HttpStatuses.NOT_IMPLEMENTED;
    } elif code == 502 {
      return HttpStatuses.BAD_GATEWAY;
    } elif code == 503 {
      return HttpStatuses.SERVICE_UNAVAILABLE;
    } elif code == 504 {
      return HttpStatuses.GATEWAY_TIMEOUT;
    } elif code == 505 {
      return HttpStatuses.HTTP_VERSION_NOT_SUPPORTED;
    } elif code == 506 {
      return HttpStatuses.VARIANT_ALSO_NEGOTIATES;
    } elif code == 507 {
      return HttpStatuses.INSUFFICIENT_STORAGE;
    } elif code == 508 {
      return HttpStatuses.LOOP_DETECTED;
    } elif code == 510 {
      return HttpStatuses.NOT_EXTENDED;
    } elif code == 511 {
      return HttpStatuses.NETWORK_AUTHENTICATION_REQUIRED;
    } else {
      return HttpStatuses.INTERNAL_SERVER_ERROR;
    }
  }

  pub static inflight fromStatusEnum(status: HttpStatuses): HttpStatus {
      if status == HttpStatuses.CONTINUE {
        return HttpStatus { code: 100, message: "Continue" };
      } elif status == HttpStatuses.SWITCHING_PROTOCOLS {
        return HttpStatus { code: 101, message: "Switching Protocols" };
      } elif status == HttpStatuses.PROCESSING {
        return HttpStatus { code: 102, message: "Processing" };
      } elif status == HttpStatuses.EARLY_HINTS {
        return HttpStatus { code: 103, message: "Early Hints" };
      } elif status == HttpStatuses.OK {
        return HttpStatus { code: 200, message: "OK" };
      } elif status == HttpStatuses.CREATED {
        return HttpStatus { code: 201, message: "Created" };
      } elif status == HttpStatuses.ACCEPTED {
        return HttpStatus { code: 202, message: "Accepted" };
      } elif status == HttpStatuses.NON_AUTHORITATIVE_INFORMATION {
        return HttpStatus { code: 203, message: "Non-Authoritative Information" };
      } elif status == HttpStatuses.NO_CONTENT {
        return HttpStatus { code: 204, message: "No Content" };
      } elif status == HttpStatuses.RESET_CONTENT {
        return HttpStatus { code: 205, message: "Reset Content" };
      } elif status == HttpStatuses.PARTIAL_CONTENT {
        return HttpStatus { code: 206, message: "Partial Content" };
      } elif status == HttpStatuses.MULTI_STATUS {
        return HttpStatus { code: 207, message: "Multi-Status" };
      } elif status == HttpStatuses.ALREADY_REPORTED {
        return HttpStatus { code: 208, message: "Already Reported" };
      } elif status == HttpStatuses.IM_USED {
        return HttpStatus { code: 226, message: "IM Used" };
      } elif status == HttpStatuses.MULTIPLE_CHOICES {
        return HttpStatus { code: 300, message: "Multiple Choices" };
      } elif status == HttpStatuses.MOVED_PERMANENTLY {
        return HttpStatus { code: 301, message: "Moved Permanently" };
      } elif status == HttpStatuses.FOUND {
        return HttpStatus { code: 302, message: "Found" };
      } elif status == HttpStatuses.SEE_OTHER {
        return HttpStatus { code: 303, message: "See Other" };
      } elif status == HttpStatuses.NOT_MODIFIED {
        return HttpStatus { code: 304, message: "Not Modified" };
      } elif status == HttpStatuses.USE_PROXY {
        return HttpStatus { code: 305, message: "Use Proxy" };
      } elif status == HttpStatuses.SWITCH_PROXY {
        return HttpStatus { code: 306, message: "Switch Proxy" };
      } elif status == HttpStatuses.TEMPORARY_REDIRECT {
        return HttpStatus { code: 307, message: "Temporary Redirect" };
      } elif status == HttpStatuses.PERMANENT_REDIRECT {
        return HttpStatus { code: 308, message: "Permanent Redirect" };
      } elif status == HttpStatuses.BAD_REQUEST {
        return HttpStatus { code: 400, message: "Bad Request" };
      } elif status == HttpStatuses.UNAUTHORIZED {
        return HttpStatus { code: 401, message: "Unauthorized" };
      } elif status == HttpStatuses.PAYMENT_REQUIRED {
        return HttpStatus { code: 402, message: "Payment Required" };
      } elif status == HttpStatuses.FORBIDDEN {
        return HttpStatus { code: 403, message: "Forbidden" };
      } elif status == HttpStatuses.NOT_FOUND {
        return HttpStatus { code: 404, message: "Not Found" };
      } elif status == HttpStatuses.METHOD_NOT_ALLOWED {
        return HttpStatus { code: 405, message: "Method Not Allowed" };
      } elif status == HttpStatuses.NOT_ACCEPTABLE {
        return HttpStatus { code: 406, message: "Not Acceptable" };
      } elif status == HttpStatuses.PROXY_AUTHENTICATION_REQUIRED {
        return HttpStatus { code: 407, message: "Proxy Authentication Required" };
      } elif status == HttpStatuses.REQUEST_TIMEOUT {
        return HttpStatus { code: 408, message: "Request Timeout" };
      } elif status == HttpStatuses.CONFLICT {
        return HttpStatus { code: 409, message: "Conflict" };
      } elif status == HttpStatuses.GONE {
        return HttpStatus { code: 410, message: "Gone" };
      } elif status == HttpStatuses.LENGTH_REQUIRED {
        return HttpStatus { code: 411, message: "Length Required" };
      } elif status == HttpStatuses.PRECONDITION_FAILED {
        return HttpStatus { code: 412, message: "Precondition Failed" };
      } elif status == HttpStatuses.PAYLOAD_TOO_LARGE {
        return HttpStatus { code: 413, message: "Payload Too Large" };
      } elif status == HttpStatuses.URI_TOO_LONG {
        return HttpStatus { code: 414, message: "URI Too Long" };
      } elif status == HttpStatuses.UNSUPPORTED_MEDIA_TYPE {
        return HttpStatus { code: 415, message: "Unsupported Media Type" };
      } elif status == HttpStatuses.RANGE_NOT_SATISFIABLE {
        return HttpStatus { code: 416, message: "Range Not Satisfiable" };
      } elif status == HttpStatuses.EXPECTATION_FAILED {
        return HttpStatus { code: 417, message: "Expectation Failed" };
      } elif status == HttpStatuses.I_M_A_TEAPOT {
        return HttpStatus { code: 418, message: "I'm a teapot" };
      } elif status == HttpStatuses.MISDIRECTED_REQUEST {
        return HttpStatus { code: 421, message: "Misdirected Request" };
      } elif status == HttpStatuses.UNPROCESSABLE_ENTITY {
        return HttpStatus { code: 422, message: "Unprocessable Entity" };
      } elif status == HttpStatuses.LOCKED {
        return HttpStatus { code: 423, message: "Locked" };
      } elif status == HttpStatuses.FAILED_DEPENDENCY {
        return HttpStatus { code: 424, message: "Failed Dependency" };
      } elif status == HttpStatuses.TOO_EARLY {
        return HttpStatus { code: 425, message: "Too Early" };
      } elif status == HttpStatuses.UPGRADE_REQUIRED {
        return HttpStatus { code: 426, message: "Upgrade Required" };
      } elif status == HttpStatuses.PRECONDITION_REQUIRED {
        return HttpStatus { code: 428, message: "Precondition Required" };
      } elif status == HttpStatuses.TOO_MANY_REQUESTS {
        return HttpStatus { code: 429, message: "Too Many Requests" };
      } elif status == HttpStatuses.REQUEST_HEADER_FIELDS_TOO_LARGE {
        return HttpStatus { code: 431, message: "Request Header Fields Too Large" };
      } elif status == HttpStatuses.UNAVAILABLE_FOR_LEGAL_REASONS {
        return HttpStatus { code: 451, message: "Unavailable For Legal Reasons" };
      } elif status == HttpStatuses.INTERNAL_SERVER_ERROR {
        return HttpStatus { code: 500, message: "Internal Server Error" };
      } elif status == HttpStatuses.NOT_IMPLEMENTED {
        return HttpStatus { code: 501, message: "Not Implemented" };
      } elif status == HttpStatuses.BAD_GATEWAY {
        return HttpStatus { code: 502, message: "Bad Gateway" };
      } elif status == HttpStatuses.SERVICE_UNAVAILABLE {
        return HttpStatus { code: 503, message: "Service Unavailable" };
      } elif status == HttpStatuses.GATEWAY_TIMEOUT {
        return HttpStatus { code: 504, message: "Gateway Timeout" };
      } elif status == HttpStatuses.HTTP_VERSION_NOT_SUPPORTED {
        return HttpStatus { code: 505, message: "HTTP Version Not Supported" };
      } elif status == HttpStatuses.VARIANT_ALSO_NEGOTIATES {
        return HttpStatus { code: 506, message: "Variant Also Negotiates" };
      } elif status == HttpStatuses.INSUFFICIENT_STORAGE {
        return HttpStatus { code: 507, message: "Insufficient Storage" };
      } elif status == HttpStatuses.LOOP_DETECTED {
        return HttpStatus { code: 508, message: "Loop Detected" };
      } elif status == HttpStatuses.NOT_EXTENDED {
        return HttpStatus { code: 510, message: "Not Extended" };
      } elif status == HttpStatuses.NETWORK_AUTHENTICATION_REQUIRED {
        return HttpStatus { code: 511, message: "Network Authentication Required" };
      } else {
        return HttpStatus { code: 999, message: "Galaxy Express 999" };
      }
  }
}



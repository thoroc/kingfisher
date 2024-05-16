bring cloud;

pub inflight class SessionResponse {
  _status: num;
  _headers: Map<str>;
  _body: str;

  new(status: num, body: Json, headers: Map<str>?) {
    this._status = status;
    this._headers = headers ?? {
      "Content-Type": "text/plain",
    };
    this._body = Json.stringify(body);
  }

  pub inflight toCloudApiResponse(): cloud.ApiResponse {
    return cloud.ApiResponse {
      status: this._status,
      headers: this._headers,
      body: this._body,
    };
  }
}

pub inflight class SessionResponseOk extends SessionResponse {
  new(body: Json) {
    super(200, body, {"Content-Type": "application/json"});
  }
}

pub inflight class SessionResponseCreated extends SessionResponse {
  new(body: Json) {
    super(201, body, {"Content-Type": "application/json"});
  }
}

pub inflight class SessionResponseNotFound extends SessionResponse {
  new(body: Json) {
    super(404, body, {"Content-Type": "application/json"});
  }
}

pub inflight class SessionResponseBadRequest extends SessionResponse {
  new(body: Json) {
    super(400, body, {"Content-Type": "application/json"});
  }
}

pub inflight class SessionResponseInternalServerError extends SessionResponse {
  new(body: Json) {
    super(500, body, {"Content-Type": "application/json"});
  }
}
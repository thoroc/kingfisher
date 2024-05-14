bring http;

pub inflight class Exception {
  pub tag: str;
  pub message: str?;

  new(tag: str, message: str?) {
    this.tag = tag;
    this.message = message;
  }

  pub raise() {
    let err = Json.stringify(this);
    throw err;
  }

  pub static fromJson(err: str): Exception {
    let je = Json.parse(err);

    return new Exception(
      je.get("tag").asStr(),
      je.tryGet("message")?.tryAsStr()
    );
  }

  pub toJson(): Json { //for logging
      return Json{tag: this.tag, message: this.message};
  }
}

// Standard exceptions, similar to those of Python
pub inflight class KeyError extends Exception {
  new(message: str?) {
    super("KeyError", message);
  }
}

pub inflight class ValueError extends Exception {
  new(message: str?) {
    super("ValueError", message);
  }
}

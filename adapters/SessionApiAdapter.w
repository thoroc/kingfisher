bring cloud;
bring "./IRestApiAdapter.w" as restApiAdapter;
bring "../core" as core;


pub class SessionApiAdapter impl restApiAdapter.IRestApiAdapter {
    _h: cloud.IFunctionHandler;

    new(handler: cloud.IFunctionHandler) {
        this._h = handler;
    }

    inflight static _textPlain(session: Session): str {
        return session.sessionId;
    }

    inflight static _textHtml(session: Session): str {
        return core.Session.formatHtml(session);
    }

    inflight static _applicationJson(session: Session): str {
        let responseBody = Json {
            sessionId: session.sessionId,
        };

        return Json.stringify(responseBody);
    }

    inflight _findContentType(formatters: Map<inflight (str): str>, headers: Map<str>): str {
        let contentTypes = (headers.tryGet("Accept") ?? "").split(",");

        for ct in contentTypes {
            if formatters.has(ct) {
                return ct;
            }
        }

        return "text/plain";
    }

    inflight _buildOkResponse(headers: Map<str>, sessionInput: str): cloud.ApiResponse {
        let session = this._h.handle(sessionInput) ?? "";  // TODO: guard against empty greeting or what??
        let formatters = {
            "text/plain" => SessionApiAdapter._textPlain,
            "text/html"  => SessionApiAdapter._textHtml,
            "application/json" => SessionApiAdapter._applicationJson
        };

        let contentType = this._findContentType(formatters, headers);

        return cloud.ApiResponse{
            status: 200,
            body: formatters.get(contentType)(session),
            headers: {"Content-Type" => contentType}
        };
    }

    inflight pub handle(request: cloud.ApiRequest): cloud.ApiResponse {
        if let session = request.query.tryGet("session") {
            return this._buildOkResponse(request.headers ?? {}, session);
        } else {
            return cloud.ApiResponse{
                status: 400,
                body: "Query sessionId=<sessionId> is missing",
                headers: {"Content-Type" => "text/plain"}
            };
        }
    }
}


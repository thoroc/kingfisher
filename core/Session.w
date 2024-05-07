pub inflight class Session {
    pub extern "../target/core/makeSession.js" static inflight makeSession(sessionId: str): str;
    pub extern "../target/core/formatHtml.js" static inflight formatHtml(sessionId: str): str;
}
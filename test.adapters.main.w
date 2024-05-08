bring cloud;
bring expect;
bring "./adapters" as adapters;
bring "./handlers" as handlers;

let sessionHandler = new handlers.GetSessionHandler();
let greetingStringAdapter = new adapters.SessionApiAdapter(sessionHandler);

test "it will return 200 and plain text answer when sessiondId is provided without headers" {
    let request = cloud.ApiRequest{
        method: cloud.HttpMethod.GET,
        path: "/sessions",
        query: {"session" => Json.stringify({ "sessionId": "Wing01" })},
        vars: {}
    };

    let response = greetingStringAdapter.handle(request);

    log("Response: {response.body!}");

    expect.equal(200, response.status);
    expect.equal("Hello, Wing!", response.body);
    expect.equal("text/plain", response.headers?.get("Content-Type"));
}

test "it will return 200 and json answer when sessiondId is provided with headers Accept: application/json" {
    let request = cloud.ApiRequest{
        method: cloud.HttpMethod.GET,
        path: "/sessions",
        query: {"session" => Json.stringify({ "sessionId": "Wing02" })},
        headers: {"Accept" => "application/json"},
        vars: {}
    };

    let response = greetingStringAdapter.handle(request);

    expect.equal(200, response.status);
    expect.equal("application/json", response.headers?.get("Content-Type"));

    let data = Json.tryParse(response.body);
    let expected = Json.stringify(Json {
        greeting: "Hello, Wing!"
    });
    expect.equal(expected, response.body);
}

test "it will return 200 and html answer when sessiondId is provided with headers Accept: text/html" {
    let request = cloud.ApiRequest{
        method: cloud.HttpMethod.GET,
        path: "/sessions",
        query: {"session" => Json.stringify({ "sessionId": "Wing03" })},
        headers: {"Accept" => "text/html"},
        vars: {}
    };

    let response = greetingStringAdapter.handle(request);

    expect.equal(200, response.status);
    expect.equal("text/html", response.headers?.get("Content-Type"));
    let body = response.body ?? "";
    assert(body.contains("Hello, Wing!"));
}

test "it will return 400 and error message when sessiondId is not provided" {
    let request = cloud.ApiRequest{
        method: cloud.HttpMethod.GET,
        path: "/sessions",
        query: {"session" => Json.stringify({ "foo": "baa" })},
        vars: {}
    };

    let response = greetingStringAdapter.handle(request);

    expect.equal(400, response.status);
    expect.equal("Query sessionId=<sessionId> is missing", response.body);
    expect.equal("text/plain", response.headers?.get("Content-Type"));
}
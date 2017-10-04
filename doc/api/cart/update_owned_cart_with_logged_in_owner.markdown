# Cart API

## Update owned cart with logged in owner

### PATCH /carts/:id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| id |  id | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /carts/27</pre>

#### Body

<pre>{"data":{"id":27,"type":"carts","attributes":{"user_id":1}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;9f7ad304956eafc4fd53a8bd5d87c2bd&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8e2a41fd-3389-4292-b96b-c16848226a89
X-Runtime: 0.058683
Content-Length: 529</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"27","type":"carts","links":{"self":"http://example.org/carts/27"},"attributes":{"user_id":1,"purchased_at":null,"created_at":"2017-10-04T20:56:53.010Z","updated_at":"2017-10-04T20:56:53.019Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/27/relationships/line_items","related":"http://example.org/carts/27/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/27/relationships/cart_purchases","related":"http://example.org/carts/27/cart_purchases"}}}}}</pre>

# Cart API

## with a logged in user with open carts

### GET /carts?filter[state]=open

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| state | State | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /carts?filter[state]=open</pre>

#### Query Parameters

<pre>filter: {&quot;state&quot;=&gt;&quot;open&quot;}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;a064460ef59cd8716a8a9d284c503227&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 27313cca-09fc-456f-b058-4f742a00e58c
X-Runtime: 0.039556
Content-Length: 532</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":[{"id":"20","type":"carts","links":{"self":"http://example.org/carts/20"},"attributes":{"user_id":14,"purchased_at":null,"created_at":"2018-05-14T06:13:02.598Z","updated_at":"2018-05-14T06:13:02.598Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/20/relationships/line_items","related":"http://example.org/carts/20/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/20/relationships/cart_purchases","related":"http://example.org/carts/20/cart_purchases"}}}}]}</pre>

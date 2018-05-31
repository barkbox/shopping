# Cart API

## with a logged in user with purchased carts

### GET /carts?filter[state]=purchased

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

<pre>GET /carts?filter[state]=purchased</pre>

#### Query Parameters

<pre>filter: {&quot;state&quot;=&gt;&quot;purchased&quot;}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;dc85642efbbc0f65c77d87ce133dd3e4&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d374f7b3-ac65-4958-b55e-040fccb04300
X-Runtime: 0.058376
Content-Length: 554</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":[{"id":"15","type":"carts","links":{"self":"http://example.org/carts/15"},"attributes":{"user_id":10,"purchased_at":"2018-05-14T06:13:02.420Z","created_at":"2018-05-14T06:13:02.411Z","updated_at":"2018-05-14T06:13:02.420Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/15/relationships/line_items","related":"http://example.org/carts/15/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/15/relationships/cart_purchases","related":"http://example.org/carts/15/cart_purchases"}}}}]}</pre>

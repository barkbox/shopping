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
ETag: W/&quot;62e26fd0641b36d7c590c1c1289b3c8a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ed008ffa-6ac4-4f85-a1dd-376efea2b3e2
X-Runtime: 0.053207
Content-Length: 554</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":[{"id":"34","type":"carts","links":{"self":"http://example.org/carts/34"},"attributes":{"user_id":17,"purchased_at":"2018-01-17T19:36:06.210Z","created_at":"2018-01-17T19:36:06.186Z","updated_at":"2018-01-17T19:36:06.210Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/34/relationships/line_items","related":"http://example.org/carts/34/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/34/relationships/cart_purchases","related":"http://example.org/carts/34/cart_purchases"}}}}]}</pre>

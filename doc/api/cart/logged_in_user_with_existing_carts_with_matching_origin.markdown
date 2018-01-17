# Cart API

## logged in user with existing carts with matching origin

### GET /carts?filter[origin]=:origin

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| origin | Origin | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /carts?filter[origin]=origin</pre>

#### Query Parameters

<pre>filter: {&quot;origin&quot;=&gt;&quot;origin&quot;}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;3642943665ba61714cbf921c5498fe26&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7a49135e-b058-452a-bd99-b7ec7446c006
X-Runtime: 0.057333
Content-Length: 1062</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":[{"id":"38","type":"carts","links":{"self":"http://example.org/carts/38"},"attributes":{"user_id":19,"purchased_at":null,"created_at":"2018-01-17T20:36:06.347Z","updated_at":"2018-01-17T19:36:06.351Z","origin":"origin"},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/38/relationships/line_items","related":"http://example.org/carts/38/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/38/relationships/cart_purchases","related":"http://example.org/carts/38/cart_purchases"}}}},{"id":"37","type":"carts","links":{"self":"http://example.org/carts/37"},"attributes":{"user_id":19,"purchased_at":null,"created_at":"2018-01-17T19:36:06.328Z","updated_at":"2018-01-17T19:36:06.346Z","origin":"origin"},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/37/relationships/line_items","related":"http://example.org/carts/37/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/37/relationships/cart_purchases","related":"http://example.org/carts/37/cart_purchases"}}}}]}</pre>

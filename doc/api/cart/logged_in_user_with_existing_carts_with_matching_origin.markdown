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
ETag: W/&quot;659d5bf66e9f3ddaa6773db50850de6c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4734d1c0-55cc-4223-ba95-458fe6a8568f
X-Runtime: 0.048311
Content-Length: 1062</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":[{"id":"30","type":"carts","links":{"self":"http://example.org/carts/30"},"attributes":{"user_id":10,"purchased_at":null,"created_at":"2018-02-28T16:46:47.032Z","updated_at":"2018-02-28T15:46:47.037Z","origin":"origin"},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/30/relationships/line_items","related":"http://example.org/carts/30/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/30/relationships/cart_purchases","related":"http://example.org/carts/30/cart_purchases"}}}},{"id":"29","type":"carts","links":{"self":"http://example.org/carts/29"},"attributes":{"user_id":10,"purchased_at":null,"created_at":"2018-02-28T15:46:47.017Z","updated_at":"2018-02-28T15:46:47.030Z","origin":"origin"},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/29/relationships/line_items","related":"http://example.org/carts/29/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/29/relationships/cart_purchases","related":"http://example.org/carts/29/cart_purchases"}}}}]}</pre>

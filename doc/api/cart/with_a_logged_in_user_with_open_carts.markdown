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
ETag: W/&quot;c79641e6e301795b3479b920fea8c6c3&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ce08a818-2ac8-496f-869c-5e6a6590619f
X-Runtime: 0.078361
Content-Length: 532</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":[{"id":"21","type":"carts","links":{"self":"http://example.org/carts/21"},"attributes":{"user_id":10,"purchased_at":null,"created_at":"2018-01-17T19:36:05.460Z","updated_at":"2018-01-17T19:36:05.460Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/21/relationships/line_items","related":"http://example.org/carts/21/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/21/relationships/cart_purchases","related":"http://example.org/carts/21/cart_purchases"}}}}]}</pre>

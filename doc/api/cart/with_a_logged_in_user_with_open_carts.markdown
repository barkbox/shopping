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
ETag: W/&quot;58fea604b31748d54c1d730a7654d1ed&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 85079f6b-865d-4792-aa1a-85f74ef949d1
X-Runtime: 0.052124
Content-Length: 532</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":[{"id":"39","type":"carts","links":{"self":"http://example.org/carts/39"},"attributes":{"user_id":17,"purchased_at":null,"created_at":"2018-02-28T15:46:47.378Z","updated_at":"2018-02-28T15:46:47.378Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/39/relationships/line_items","related":"http://example.org/carts/39/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/39/relationships/cart_purchases","related":"http://example.org/carts/39/cart_purchases"}}}}]}</pre>

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
ETag: W/&quot;e6da86fa45434770a77d899c54b1875d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7757a4e9-101c-4a42-aa9e-3585206c4606
X-Runtime: 0.050891
Content-Length: 554</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":[{"id":"32","type":"carts","links":{"self":"http://example.org/carts/32"},"attributes":{"user_id":12,"purchased_at":"2018-02-28T15:46:47.137Z","created_at":"2018-02-28T15:46:47.112Z","updated_at":"2018-02-28T15:46:47.138Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/32/relationships/line_items","related":"http://example.org/carts/32/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/32/relationships/cart_purchases","related":"http://example.org/carts/32/cart_purchases"}}}}]}</pre>

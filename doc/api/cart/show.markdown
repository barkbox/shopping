# Cart API

## Show

### GET /carts/:id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| cart_id | Cart id | true |  |

### Request

#### Headers

<pre>Host: example.org
Cookie: </pre>

#### Route

<pre>GET /carts/6</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;d0b4569a73eabf2c50741dbede7d7af3&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d89528c0-b834-4905-b80b-ae115875f0ac
X-Runtime: 0.050965
Content-Length: 523</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"6","type":"carts","links":{"self":"http://example.org/carts/6"},"attributes":{"user_id":6,"purchased_at":null,"created_at":"2017-09-25T22:11:02.944Z","updated_at":"2017-09-25T22:11:02.944Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/6/relationships/line_items","related":"http://example.org/carts/6/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/6/relationships/cart_purchases","related":"http://example.org/carts/6/cart_purchases"}}}}}</pre>

# Cart API

## Show incl line items

### GET /api/v1/carts/:id?include=line_items

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| cart_id | Cart id | true |  |

### Request

#### Headers

<pre>Host: example.org
Cookie: </pre>

#### Route

<pre>GET /api/v1/carts/3?include=line_items</pre>

#### Query Parameters

<pre>include: line_items</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;4b713d5396f815d73939f86792e5b964&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 269277bf-8a05-4ac0-a018-8dbad0151195
X-Runtime: 0.099796
Content-Length: 913</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"3","type":"carts","links":{"self":"http://example.org/api/v1/carts/3"},"attributes":{"user_id":3,"purchased_at":null,"created_at":"2017-07-25T14:34:51.315Z","updated_at":"2017-07-25T14:34:51.315Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/api/v1/carts/3/relationships/line_items","related":"http://example.org/api/v1/carts/3/line_items"},"data":[{"type":"line_items","id":"3"}]}}},"included":[{"id":"3","type":"line_items","links":{"self":"http://example.org/api/v1/line_items/3"},"attributes":{"cart_id":3,"sale_price":"5.0","list_price":"5.0","quantity":1,"created_at":"2017-07-25T14:34:51.324Z","updated_at":"2017-07-25T14:34:51.324Z","source_id":3,"source_type":"Item","source_sku":"IMASKU"},"relationships":{"cart":{"links":{"self":"http://example.org/api/v1/line_items/3/relationships/cart","related":"http://example.org/api/v1/line_items/3/cart"}}}}]}</pre>

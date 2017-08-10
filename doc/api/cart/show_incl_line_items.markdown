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

<pre>GET /api/v1/carts/1?include=line_items</pre>

#### Query Parameters

<pre>include: line_items</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;cd19decb6bdeabf7998b39213767982b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b33b3f94-4439-4a48-b43b-3e201f3abb11
X-Runtime: 0.127789
Content-Length: 1075</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"1","type":"carts","links":{"self":"http://example.org/api/v1/carts/1"},"attributes":{"user_id":1,"purchased_at":null,"created_at":"2017-08-10T19:58:24.869Z","updated_at":"2017-08-10T19:58:24.869Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/api/v1/carts/1/relationships/line_items","related":"http://example.org/api/v1/carts/1/line_items"},"data":[{"type":"line_items","id":"1"}]},"cart_purchases":{"links":{"self":"http://example.org/api/v1/carts/1/relationships/cart_purchases","related":"http://example.org/api/v1/carts/1/cart_purchases"}}}},"included":[{"id":"1","type":"line_items","links":{"self":"http://example.org/api/v1/line_items/1"},"attributes":{"cart_id":1,"sale_price":"5.0","list_price":"5.0","quantity":1,"created_at":"2017-08-10T19:58:24.914Z","updated_at":"2017-08-10T19:58:24.914Z","source_id":1,"source_type":"Item","source_sku":"IMASKU"},"relationships":{"cart":{"links":{"self":"http://example.org/api/v1/line_items/1/relationships/cart","related":"http://example.org/api/v1/line_items/1/cart"}}}}]}</pre>

# Cart API

## Show including line items (with logged in cart owner)

### GET /carts/:id?include=line_items

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| cart_id | Cart ID | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /carts/32?include=line_items</pre>

#### Query Parameters

<pre>include: line_items</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;4d3c2d3a47d39ed3ec1fbeea916b370f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2d660d8c-58f9-4210-a60a-3bcf98986fe9
X-Runtime: 0.080556
Content-Length: 1046</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"32","type":"carts","links":{"self":"http://example.org/carts/32"},"attributes":{"user_id":15,"purchased_at":null,"created_at":"2018-01-17T19:36:06.027Z","updated_at":"2018-01-17T19:36:06.027Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/32/relationships/line_items","related":"http://example.org/carts/32/line_items"},"data":[{"type":"line_items","id":"19"}]},"cart_purchases":{"links":{"self":"http://example.org/carts/32/relationships/cart_purchases","related":"http://example.org/carts/32/cart_purchases"}}}},"included":[{"id":"19","type":"line_items","links":{"self":"http://example.org/line_items/19"},"attributes":{"cart_id":32,"sale_price":"5.0","list_price":"5.0","quantity":1,"created_at":"2018-01-17T19:36:06.042Z","updated_at":"2018-01-17T19:36:06.042Z","source_id":19,"source_type":"Item","source_sku":"IMASKU","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/19/relationships/cart","related":"http://example.org/line_items/19/cart"}}}}]}</pre>

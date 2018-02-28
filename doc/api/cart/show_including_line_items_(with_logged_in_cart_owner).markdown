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

<pre>GET /carts/24?include=line_items</pre>

#### Query Parameters

<pre>include: line_items</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;ae1891d3e3f17f7070da39420a71df1c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 67608c35-fcae-447e-a75c-612e7319fb83
X-Runtime: 0.070504
Content-Length: 1069</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"24","type":"carts","links":{"self":"http://example.org/carts/24"},"attributes":{"user_id":9,"purchased_at":null,"created_at":"2018-02-28T15:46:46.715Z","updated_at":"2018-02-28T15:46:46.715Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/24/relationships/line_items","related":"http://example.org/carts/24/line_items"},"data":[{"type":"line_items","id":"19"}]},"cart_purchases":{"links":{"self":"http://example.org/carts/24/relationships/cart_purchases","related":"http://example.org/carts/24/cart_purchases"}}}},"included":[{"id":"19","type":"line_items","links":{"self":"http://example.org/line_items/19"},"attributes":{"cart_id":24,"sale_price":"5.0","list_price":"5.0","quantity":1,"created_at":"2018-02-28T15:46:46.731Z","updated_at":"2018-02-28T15:46:46.731Z","source_id":22,"source_type":"Item","source_sku":"IMASKU","source_name":"An Item","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/19/relationships/cart","related":"http://example.org/line_items/19/cart"}}}}]}</pre>

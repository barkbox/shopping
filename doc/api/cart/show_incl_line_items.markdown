# Cart API

## Show incl line items

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

<pre>GET /carts/1?include=line_items</pre>

#### Query Parameters

<pre>include: line_items</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;8181dab397f3669896aa63223f10e509&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1fffcd69-b953-4533-875f-ac0628b79746
X-Runtime: 0.112295
Content-Length: 1032</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"1","type":"carts","links":{"self":"http://example.org/carts/1"},"attributes":{"user_id":1,"purchased_at":null,"created_at":"2017-09-26T14:27:54.989Z","updated_at":"2017-09-26T14:27:54.989Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/1/relationships/line_items","related":"http://example.org/carts/1/line_items"},"data":[{"type":"line_items","id":"1"}]},"cart_purchases":{"links":{"self":"http://example.org/carts/1/relationships/cart_purchases","related":"http://example.org/carts/1/cart_purchases"}}}},"included":[{"id":"1","type":"line_items","links":{"self":"http://example.org/line_items/1"},"attributes":{"cart_id":1,"sale_price":"5.0","list_price":"5.0","quantity":1,"created_at":"2017-09-26T14:27:55.042Z","updated_at":"2017-09-26T14:27:55.042Z","source_id":1,"source_type":"Item","source_sku":"IMASKU","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/1/relationships/cart","related":"http://example.org/line_items/1/cart"}}}}]}</pre>

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

<pre>GET /carts/31?include=line_items</pre>

#### Query Parameters

<pre>include: line_items</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;76df3cd6168005fe09f21fd1f5d932c3&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c73ad4eb-ab24-4ad9-9c04-35db3297e90d
X-Runtime: 0.091618
Content-Length: 1045</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"31","type":"carts","links":{"self":"http://example.org/carts/31"},"attributes":{"user_id":7,"purchased_at":null,"created_at":"2017-10-04T20:56:53.218Z","updated_at":"2017-10-04T20:56:53.218Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/31/relationships/line_items","related":"http://example.org/carts/31/line_items"},"data":[{"type":"line_items","id":"21"}]},"cart_purchases":{"links":{"self":"http://example.org/carts/31/relationships/cart_purchases","related":"http://example.org/carts/31/cart_purchases"}}}},"included":[{"id":"21","type":"line_items","links":{"self":"http://example.org/line_items/21"},"attributes":{"cart_id":31,"sale_price":"5.0","list_price":"5.0","quantity":1,"created_at":"2017-10-04T20:56:53.224Z","updated_at":"2017-10-04T20:56:53.224Z","source_id":23,"source_type":"Item","source_sku":"IMASKU","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/21/relationships/cart","related":"http://example.org/line_items/21/cart"}}}}]}</pre>

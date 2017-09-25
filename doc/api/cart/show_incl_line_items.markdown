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

<pre>GET /api/v1/carts/9?include=line_items</pre>

#### Query Parameters

<pre>include: line_items</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;acc2edbf8e289018fe342ee71a46de17&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8b1555d5-c162-4fad-bbd2-0fbf4cdf5923
X-Runtime: 0.082391
Content-Length: 1075</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"9","type":"carts","links":{"self":"http://example.org/api/v1/carts/9"},"attributes":{"user_id":6,"purchased_at":null,"created_at":"2017-09-25T17:53:24.740Z","updated_at":"2017-09-25T17:53:24.740Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/api/v1/carts/9/relationships/line_items","related":"http://example.org/api/v1/carts/9/line_items"},"data":[{"type":"line_items","id":"9"}]},"cart_purchases":{"links":{"self":"http://example.org/api/v1/carts/9/relationships/cart_purchases","related":"http://example.org/api/v1/carts/9/cart_purchases"}}}},"included":[{"id":"9","type":"line_items","links":{"self":"http://example.org/api/v1/line_items/9"},"attributes":{"cart_id":9,"sale_price":"5.0","list_price":"5.0","quantity":1,"created_at":"2017-09-25T17:53:24.746Z","updated_at":"2017-09-25T17:53:24.746Z","source_id":9,"source_type":"Item","source_sku":"IMASKU"},"relationships":{"cart":{"links":{"self":"http://example.org/api/v1/line_items/9/relationships/cart","related":"http://example.org/api/v1/line_items/9/cart"}}}}]}</pre>

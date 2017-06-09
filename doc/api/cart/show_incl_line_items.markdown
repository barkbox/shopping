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
ETag: W/&quot;ce1c907b374fc93348ebeb796649a12d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 43983960-4e05-4ae9-a30c-ff94eeee8b11
X-Runtime: 0.068351
Content-Length: 899</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"1","type":"carts","links":{"self":"http://example.org/api/v1/carts/1"},"attributes":{"user_id":2,"purchased_at":null,"created_at":"2017-06-09T14:54:16.793Z","updated_at":"2017-06-09T14:54:16.793Z"},"relationships":{"line_items":{"links":{"self":"http://example.org/api/v1/carts/1/relationships/line_items","related":"http://example.org/api/v1/carts/1/line_items"},"data":[{"type":"line_items","id":"1"}]}}},"included":[{"id":"1","type":"line_items","links":{"self":"http://example.org/api/v1/line_items/1"},"attributes":{"cart_id":1,"sale_price":"5.0","list_price":"5.0","quantity":1,"created_at":"2017-06-09T14:54:16.798Z","updated_at":"2017-06-09T14:54:16.798Z","source_id":2,"source_type":"Item","source_sku":"IMASKU"},"relationships":{"cart":{"links":{"self":"http://example.org/api/v1/line_items/1/relationships/cart","related":"http://example.org/api/v1/line_items/1/cart"}}}}]}</pre>

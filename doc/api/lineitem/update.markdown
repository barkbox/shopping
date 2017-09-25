# LineItem API

## Update

### PUT /api/v1/line_items/:id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| id | Line item id | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>PUT /api/v1/line_items/5</pre>

#### Body

<pre>{"data":{"id":5,"type":"line_items","attributes":{"quantity":2}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;3dc4b5af16089a073795afe9f6769dd5&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 66a7f138-876b-422c-aca8-b82a9ee43402
X-Runtime: 0.040718
Content-Length: 472</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"5","type":"line_items","links":{"self":"http://example.org/api/v1/line_items/5"},"attributes":{"cart_id":5,"sale_price":"5.0","list_price":"5.0","quantity":2,"created_at":"2017-09-25T17:53:24.521Z","updated_at":"2017-09-25T17:53:24.529Z","source_id":5,"source_type":"Item","source_sku":"IMASKU"},"relationships":{"cart":{"links":{"self":"http://example.org/api/v1/line_items/5/relationships/cart","related":"http://example.org/api/v1/line_items/5/cart"}}}}}</pre>

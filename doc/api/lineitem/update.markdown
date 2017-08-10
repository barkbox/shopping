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

<pre>PUT /api/v1/line_items/6</pre>

#### Body

<pre>{"data":{"id":6,"type":"line_items","attributes":{"quantity":2}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;d0dd3f16f993fe09037072034786a74e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: eb7b1b8a-0308-4aa0-84b8-67f660834da7
X-Runtime: 0.035466
Content-Length: 472</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"6","type":"line_items","links":{"self":"http://example.org/api/v1/line_items/6"},"attributes":{"cart_id":6,"sale_price":"5.0","list_price":"5.0","quantity":2,"created_at":"2017-08-10T19:58:25.246Z","updated_at":"2017-08-10T19:58:25.254Z","source_id":6,"source_type":"Item","source_sku":"IMASKU"},"relationships":{"cart":{"links":{"self":"http://example.org/api/v1/line_items/6/relationships/cart","related":"http://example.org/api/v1/line_items/6/cart"}}}}}</pre>

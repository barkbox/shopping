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

<pre>PUT /api/v1/line_items/4</pre>

#### Body

<pre>{"data":{"id":4,"type":"line_items","attributes":{"quantity":2}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;b67681f4ee0cec71d72fb98664de4416&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e7ad2ce2-83c3-4545-b3ff-e41bacd2bf00
X-Runtime: 0.050729
Content-Length: 472</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"4","type":"line_items","links":{"self":"http://example.org/api/v1/line_items/4"},"attributes":{"cart_id":4,"sale_price":"5.0","list_price":"5.0","quantity":2,"created_at":"2017-07-25T14:34:51.439Z","updated_at":"2017-07-25T14:34:51.452Z","source_id":4,"source_type":"Item","source_sku":"IMASKU"},"relationships":{"cart":{"links":{"self":"http://example.org/api/v1/line_items/4/relationships/cart","related":"http://example.org/api/v1/line_items/4/cart"}}}}}</pre>

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

<pre>PUT /api/v1/line_items/1</pre>

#### Body

<pre>{"data":{"id":1,"type":"line_items","attributes":{"quantity":2}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;916688394ba77bc9438bc63e086b4f6d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: dd82a9cd-5ad0-42c2-aa43-7155486cf707
X-Runtime: 0.052721
Content-Length: 472</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"1","type":"line_items","links":{"self":"http://example.org/api/v1/line_items/1"},"attributes":{"cart_id":1,"sale_price":"5.0","list_price":"5.0","quantity":2,"created_at":"2017-06-09T14:54:16.897Z","updated_at":"2017-06-09T14:54:16.912Z","source_id":4,"source_type":"Item","source_sku":"IMASKU"},"relationships":{"cart":{"links":{"self":"http://example.org/api/v1/line_items/1/relationships/cart","related":"http://example.org/api/v1/line_items/1/cart"}}}}}</pre>

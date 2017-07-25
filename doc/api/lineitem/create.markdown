# LineItem API

## Create

### POST /api/v1/line_items

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| cart_id | Data attributes cart | true | data[attributes] |
| source_id | Data attributes source | true | data[attributes] |
| source_type | Data attributes source type | true | data[attributes] |
| sale_price | Data attributes sale price | true | data[attributes] |
| list_price | Data attributes list price | true | data[attributes] |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /api/v1/line_items</pre>

#### Body

<pre>{"data":{"attributes":{"cart_id":6,"source_id":6,"source_type":"Item","sale_price":1.0,"list_price":1.0},"type":"line_items"}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
Location: http://example.org/api/v1/line_items/6
ETag: W/&quot;b977c5c036ad0f1f2a6c93a74ceaa1ab&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3e5081a7-0f8e-4685-9095-5f014fd0a87a
X-Runtime: 0.039891
Content-Length: 475</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"6","type":"line_items","links":{"self":"http://example.org/api/v1/line_items/6"},"attributes":{"cart_id":6,"sale_price":"1.0","list_price":"1.0","quantity":null,"created_at":"2017-07-25T14:34:51.553Z","updated_at":"2017-07-25T14:34:51.553Z","source_id":6,"source_type":"Item","source_sku":"IMASKU"},"relationships":{"cart":{"links":{"self":"http://example.org/api/v1/line_items/6/relationships/cart","related":"http://example.org/api/v1/line_items/6/cart"}}}}}</pre>

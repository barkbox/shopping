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

<pre>{"data":{"attributes":{"cart_id":5,"source_id":5,"source_type":"Item","sale_price":1.0,"list_price":1.0},"type":"line_items"}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
Location: http://example.org/api/v1/line_items/5
ETag: W/&quot;08a42f7d5947144c62d3ac154fa45b47&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6148ecbc-c823-4193-b9b8-bf7cd7793d68
X-Runtime: 0.036876
Content-Length: 475</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"5","type":"line_items","links":{"self":"http://example.org/api/v1/line_items/5"},"attributes":{"cart_id":5,"sale_price":"1.0","list_price":"1.0","quantity":null,"created_at":"2017-08-10T19:58:25.197Z","updated_at":"2017-08-10T19:58:25.197Z","source_id":5,"source_type":"Item","source_sku":"IMASKU"},"relationships":{"cart":{"links":{"self":"http://example.org/api/v1/line_items/5/relationships/cart","related":"http://example.org/api/v1/line_items/5/cart"}}}}}</pre>

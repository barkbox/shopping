# LineItem API

## Create

### POST /api/v1/line_items

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| cart_id | Data attributes cart | true | data[attributes] |
| source_id | Data attributes source | true | data[attributes] |
| source_type | Data attributes source type | true | data[attributes] |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /api/v1/line_items</pre>

#### Body

<pre>{"data":{"attributes":{"cart_id":1,"source_id":6,"source_type":"Item"},"type":"line_items"}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
Location: http://example.org/api/v1/line_items/1
ETag: W/&quot;1726ebd6e46c47e4cb9c9c7a710cf676&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 0b068a83-f596-4a16-ba83-9aabd89855c3
X-Runtime: 0.037149
Content-Length: 470</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"1","type":"line_items","links":{"self":"http://example.org/api/v1/line_items/1"},"attributes":{"cart_id":1,"sale_price":null,"list_price":null,"quantity":1,"created_at":"2017-06-09T14:54:16.991Z","updated_at":"2017-06-09T14:54:16.991Z","source_id":6,"source_type":"Item","source_sku":"IMASKU"},"relationships":{"cart":{"links":{"self":"http://example.org/api/v1/line_items/1/relationships/cart","related":"http://example.org/api/v1/line_items/1/cart"}}}}}</pre>

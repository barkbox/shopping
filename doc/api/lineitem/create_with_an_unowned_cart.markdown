# LineItem API

## Create with an unowned cart

### POST /line_items

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

<pre>POST /line_items</pre>

#### Body

<pre>{"data":{"type":"line_items","attributes":{"cart_id":14,"source_id":7,"source_type":"Item","sale_price":1.0,"list_price":1.0}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
Location: http://example.org/line_items/7
ETag: W/&quot;720ae0156a975691c2a2af274069ab4e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2e51e1d8-5d43-4df0-8d26-5e2f671fb2b2
X-Runtime: 0.043180
Content-Length: 468</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"7","type":"line_items","links":{"self":"http://example.org/line_items/7"},"attributes":{"cart_id":14,"sale_price":"1.0","list_price":"1.0","quantity":null,"created_at":"2017-10-04T20:56:52.572Z","updated_at":"2017-10-04T20:56:52.572Z","source_id":7,"source_type":"Item","source_sku":"IMASKU","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/7/relationships/cart","related":"http://example.org/line_items/7/cart"}}}}}</pre>

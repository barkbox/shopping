# LineItem API

## Create

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

<pre>{"data":{"attributes":{"cart_id":1,"source_id":1,"source_type":"Item","sale_price":1.0,"list_price":1.0},"type":"line_items"}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
Location: http://example.org/line_items/1
ETag: W/&quot;439307ec891db167472cbe0b92eed8b8&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1446db50-9bfc-4527-ae83-88ed79001377
X-Runtime: 0.091385
Content-Length: 467</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"1","type":"line_items","links":{"self":"http://example.org/line_items/1"},"attributes":{"cart_id":1,"sale_price":"1.0","list_price":"1.0","quantity":null,"created_at":"2017-09-25T22:11:02.652Z","updated_at":"2017-09-25T22:11:02.652Z","source_id":1,"source_type":"Item","source_sku":"IMASKU","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/1/relationships/cart","related":"http://example.org/line_items/1/cart"}}}}}</pre>

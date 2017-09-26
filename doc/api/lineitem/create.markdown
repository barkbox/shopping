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

<pre>{"data":{"attributes":{"cart_id":7,"source_id":6,"source_type":"Item","sale_price":1.0,"list_price":1.0},"type":"line_items"}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
Location: http://example.org/line_items/6
ETag: W/&quot;5e6f308fdf147dc832aa9ee22876ee6a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 312c321a-dbbb-4074-8016-e0672f665e60
X-Runtime: 0.047316
Content-Length: 467</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"6","type":"line_items","links":{"self":"http://example.org/line_items/6"},"attributes":{"cart_id":7,"sale_price":"1.0","list_price":"1.0","quantity":null,"created_at":"2017-09-26T14:27:55.428Z","updated_at":"2017-09-26T14:27:55.428Z","source_id":6,"source_type":"Item","source_sku":"IMASKU","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/6/relationships/cart","related":"http://example.org/line_items/6/cart"}}}}}</pre>

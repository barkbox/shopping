# LineItem API

## Create with an owned cart and logged in owner

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

<pre>{"data":{"type":"line_items","attributes":{"cart_id":13,"source_id":6,"source_type":"Item","sale_price":1.0,"list_price":1.0}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
Location: http://example.org/line_items/6
ETag: W/&quot;08e1dbc501db2e453b6e9368225310b2&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 70d7fce1-90f6-4aa0-a41d-2ace4ba37268
X-Runtime: 0.042387
Content-Length: 468</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"6","type":"line_items","links":{"self":"http://example.org/line_items/6"},"attributes":{"cart_id":13,"sale_price":"1.0","list_price":"1.0","quantity":null,"created_at":"2017-10-04T20:56:52.519Z","updated_at":"2017-10-04T20:56:52.519Z","source_id":6,"source_type":"Item","source_sku":"IMASKU","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/6/relationships/cart","related":"http://example.org/line_items/6/cart"}}}}}</pre>

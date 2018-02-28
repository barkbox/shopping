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

<pre>{"data":{"attributes":{"cart_id":1,"source_id":1,"source_type":"Item","sale_price":1.0,"list_price":1.0},"type":"line_items"}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
Location: http://example.org/line_items/1
ETag: W/&quot;b8f1046739af34d3b7946f181d7b63aa&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3a4b44ac-7054-4089-bd0a-201f89c0fa76
X-Runtime: 0.075112
Content-Length: 491</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"1","type":"line_items","links":{"self":"http://example.org/line_items/1"},"attributes":{"cart_id":1,"sale_price":"1.0","list_price":"1.0","quantity":null,"created_at":"2018-02-28T15:46:45.570Z","updated_at":"2018-02-28T15:46:45.570Z","source_id":1,"source_type":"Item","source_sku":"IMASKU","source_name":"An Item","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/1/relationships/cart","related":"http://example.org/line_items/1/cart"}}}}}</pre>

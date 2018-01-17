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

<pre>{"data":{"attributes":{"cart_id":46,"source_id":31,"source_type":"Item","sale_price":1.0,"list_price":1.0},"type":"line_items"}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
Location: http://example.org/line_items/30
ETag: W/&quot;0b3cbd9bac15b2bb044831a2921e5860&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 13866e8f-51d3-4c41-b6c3-e60bd0cba99c
X-Runtime: 0.076190
Content-Length: 473</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"30","type":"line_items","links":{"self":"http://example.org/line_items/30"},"attributes":{"cart_id":46,"sale_price":"1.0","list_price":"1.0","quantity":null,"created_at":"2018-01-17T19:36:06.906Z","updated_at":"2018-01-17T19:36:06.906Z","source_id":31,"source_type":"Item","source_sku":"IMASKU","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/30/relationships/cart","related":"http://example.org/line_items/30/cart"}}}}}</pre>

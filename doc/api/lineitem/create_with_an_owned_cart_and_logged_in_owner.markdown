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

<pre>{"data":{"attributes":{"cart_id":4,"source_id":4,"source_type":"Item","sale_price":1.0,"list_price":1.0},"type":"line_items"}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
Location: http://example.org/line_items/3
ETag: W/&quot;832f8e286e7f81b2b9d77600331e1251&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6ca61eea-881f-48c0-bdf6-c824a3dbc267
X-Runtime: 0.046752
Content-Length: 491</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"3","type":"line_items","links":{"self":"http://example.org/line_items/3"},"attributes":{"cart_id":4,"sale_price":"1.0","list_price":"1.0","quantity":null,"created_at":"2018-02-28T15:46:45.718Z","updated_at":"2018-02-28T15:46:45.718Z","source_id":4,"source_type":"Item","source_sku":"IMASKU","source_name":"An Item","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/3/relationships/cart","related":"http://example.org/line_items/3/cart"}}}}}</pre>

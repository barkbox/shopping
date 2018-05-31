# LineItem API

## Create with an owned cart and logged in admin

### POST /carts/:cart_id/line_items

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
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

<pre>POST /carts/94/line_items</pre>

#### Body

<pre>{"data":{"type":"line_items","attributes":{"cart_id":94,"source_id":69,"source_type":"Item","sale_price":1.0,"list_price":1.0}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
Location: http://example.org/line_items/64
ETag: W/&quot;3d28bf7923ee6b2271308f9f1f6c0f35&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a297084e-ec02-4bdf-bc7b-22c69ba665aa
X-Runtime: 0.021179
Content-Length: 497</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"64","type":"line_items","links":{"self":"http://example.org/line_items/64"},"attributes":{"cart_id":94,"sale_price":"1.0","list_price":"1.0","quantity":null,"created_at":"2018-05-14T06:13:04.967Z","updated_at":"2018-05-14T06:13:04.967Z","source_id":69,"source_type":"Item","source_sku":"IMASKU","source_name":"An Item","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/64/relationships/cart","related":"http://example.org/line_items/64/cart"}}}}}</pre>

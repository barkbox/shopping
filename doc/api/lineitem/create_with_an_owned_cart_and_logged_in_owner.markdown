# LineItem API

## Create with an owned cart and logged in owner

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

<pre>POST /carts/93/line_items</pre>

#### Body

<pre>{"data":{"type":"line_items","attributes":{"cart_id":93,"source_id":68,"source_type":"Item","sale_price":1.0,"list_price":1.0}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
Location: http://example.org/line_items/63
ETag: W/&quot;63cc0df07c5c3061d77390efb96bc728&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ed373bc7-5350-4600-86ad-46b19526258e
X-Runtime: 0.025724
Content-Length: 497</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"63","type":"line_items","links":{"self":"http://example.org/line_items/63"},"attributes":{"cart_id":93,"sale_price":"1.0","list_price":"1.0","quantity":null,"created_at":"2018-05-14T06:13:04.932Z","updated_at":"2018-05-14T06:13:04.932Z","source_id":68,"source_type":"Item","source_sku":"IMASKU","source_name":"An Item","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/63/relationships/cart","related":"http://example.org/line_items/63/cart"}}}}}</pre>

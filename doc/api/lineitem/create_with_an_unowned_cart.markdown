# LineItem API

## Create with an unowned cart

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

<pre>POST /carts/95/line_items</pre>

#### Body

<pre>{"data":{"type":"line_items","attributes":{"cart_id":95,"source_id":70,"source_type":"Item","sale_price":1.0,"list_price":1.0}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
Location: http://example.org/line_items/65
ETag: W/&quot;1ed66b3810ed7003d2317da6485fcb1d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 54fe4cfc-8c94-4993-8f3c-75d8ab70a512
X-Runtime: 0.028234
Content-Length: 497</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"65","type":"line_items","links":{"self":"http://example.org/line_items/65"},"attributes":{"cart_id":95,"sale_price":"1.0","list_price":"1.0","quantity":null,"created_at":"2018-05-14T06:13:05.002Z","updated_at":"2018-05-14T06:13:05.002Z","source_id":70,"source_type":"Item","source_sku":"IMASKU","source_name":"An Item","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/65/relationships/cart","related":"http://example.org/line_items/65/cart"}}}}}</pre>

# LineItem API

## Find line_items with an owned cart and logged in owner

### GET /carts/:cart_id/line_items

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| id |  id | true |  |
| cart_id |  cart | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /carts/71/line_items?id=46</pre>

#### Query Parameters

<pre>id: 46</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;047c24c735b410c4db50e408df3df04f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8053ab60-4151-4314-9055-aea09b1040e5
X-Runtime: 0.030186
Content-Length: 496</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":[{"id":"46","type":"line_items","links":{"self":"http://example.org/line_items/46"},"attributes":{"cart_id":71,"sale_price":"5.0","list_price":"5.0","quantity":1,"created_at":"2018-05-14T06:13:04.090Z","updated_at":"2018-05-14T06:13:04.090Z","source_id":46,"source_type":"Item","source_sku":"IMASKU","source_name":"An Item","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/46/relationships/cart","related":"http://example.org/line_items/46/cart"}}}}]}</pre>

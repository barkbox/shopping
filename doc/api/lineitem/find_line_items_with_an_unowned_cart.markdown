# LineItem API

## Find line_items with an unowned cart

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

<pre>GET /carts/70/line_items?id=45</pre>

#### Query Parameters

<pre>id: 45</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;cc11a0da0f73a04cadddc2664c1f1544&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 80e0bf85-f91c-4cea-b9ca-7029e5be66c7
X-Runtime: 0.022382
Content-Length: 496</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":[{"id":"45","type":"line_items","links":{"self":"http://example.org/line_items/45"},"attributes":{"cart_id":70,"sale_price":"5.0","list_price":"5.0","quantity":1,"created_at":"2018-05-14T06:13:04.052Z","updated_at":"2018-05-14T06:13:04.052Z","source_id":45,"source_type":"Item","source_sku":"IMASKU","source_name":"An Item","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/45/relationships/cart","related":"http://example.org/line_items/45/cart"}}}}]}</pre>

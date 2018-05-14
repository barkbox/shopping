# LineItem API

## Find line_items with an owned cart and logged in admin

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

<pre>GET /carts/73/line_items?id=48</pre>

#### Query Parameters

<pre>id: 48</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;058b719641775872e3ec08b929a619bd&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f9b3493c-a8ce-43f9-9827-cc5273127fdb
X-Runtime: 0.020265
Content-Length: 496</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":[{"id":"48","type":"line_items","links":{"self":"http://example.org/line_items/48"},"attributes":{"cart_id":73,"sale_price":"5.0","list_price":"5.0","quantity":1,"created_at":"2018-05-14T06:13:04.171Z","updated_at":"2018-05-14T06:13:04.171Z","source_id":48,"source_type":"Item","source_sku":"IMASKU","source_name":"An Item","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/48/relationships/cart","related":"http://example.org/line_items/48/cart"}}}}]}</pre>

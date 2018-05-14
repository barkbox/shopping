# Cart API

## Show including line items (with logged in cart owner)

### GET /carts/:id?include=line_items

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| cart_id | Cart ID | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /carts/29?include=line_items</pre>

#### Query Parameters

<pre>include: line_items</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;5e0a14f0acdb4ba57d5949ac845d9f58&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 70e31652-b60d-48af-897b-53a4384fbce3
X-Runtime: 0.044427
Content-Length: 1070</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"29","type":"carts","links":{"self":"http://example.org/carts/29"},"attributes":{"user_id":17,"purchased_at":null,"created_at":"2018-05-14T06:13:02.893Z","updated_at":"2018-05-14T06:13:02.893Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/29/relationships/line_items","related":"http://example.org/carts/29/line_items"},"data":[{"type":"line_items","id":"22"}]},"cart_purchases":{"links":{"self":"http://example.org/carts/29/relationships/cart_purchases","related":"http://example.org/carts/29/cart_purchases"}}}},"included":[{"id":"22","type":"line_items","links":{"self":"http://example.org/line_items/22"},"attributes":{"cart_id":29,"sale_price":"5.0","list_price":"5.0","quantity":1,"created_at":"2018-05-14T06:13:02.899Z","updated_at":"2018-05-14T06:13:02.899Z","source_id":22,"source_type":"Item","source_sku":"IMASKU","source_name":"An Item","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/22/relationships/cart","related":"http://example.org/line_items/22/cart"}}}}]}</pre>

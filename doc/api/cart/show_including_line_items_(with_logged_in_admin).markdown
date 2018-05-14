# Cart API

## Show including line items (with logged in admin)

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

<pre>GET /carts/28?include=line_items</pre>

#### Query Parameters

<pre>include: line_items</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;672ff70004cc333452d4752c6593381b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3ce4f24d-5b7e-4627-adde-9e626e7980c9
X-Runtime: 0.047136
Content-Length: 1070</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"28","type":"carts","links":{"self":"http://example.org/carts/28"},"attributes":{"user_id":16,"purchased_at":null,"created_at":"2018-05-14T06:13:02.831Z","updated_at":"2018-05-14T06:13:02.831Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/28/relationships/line_items","related":"http://example.org/carts/28/line_items"},"data":[{"type":"line_items","id":"21"}]},"cart_purchases":{"links":{"self":"http://example.org/carts/28/relationships/cart_purchases","related":"http://example.org/carts/28/cart_purchases"}}}},"included":[{"id":"21","type":"line_items","links":{"self":"http://example.org/line_items/21"},"attributes":{"cart_id":28,"sale_price":"5.0","list_price":"5.0","quantity":1,"created_at":"2018-05-14T06:13:02.838Z","updated_at":"2018-05-14T06:13:02.838Z","source_id":21,"source_type":"Item","source_sku":"IMASKU","source_name":"An Item","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/21/relationships/cart","related":"http://example.org/line_items/21/cart"}}}}]}</pre>

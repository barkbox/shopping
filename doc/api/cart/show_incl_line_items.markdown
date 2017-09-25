# Cart API

## Show incl line items

### GET /carts/:id?include=line_items

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| cart_id | Cart id | true |  |

### Request

#### Headers

<pre>Host: example.org
Cookie: </pre>

#### Route

<pre>GET /carts/5?include=line_items</pre>

#### Query Parameters

<pre>include: line_items</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;982c3e87a06a383c0866d01ba679b7d6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 98f8b0fe-f935-499f-8f03-721595d59c12
X-Runtime: 0.085556
Content-Length: 1032</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"5","type":"carts","links":{"self":"http://example.org/carts/5"},"attributes":{"user_id":5,"purchased_at":null,"created_at":"2017-09-25T22:11:02.842Z","updated_at":"2017-09-25T22:11:02.842Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/5/relationships/line_items","related":"http://example.org/carts/5/line_items"},"data":[{"type":"line_items","id":"5"}]},"cart_purchases":{"links":{"self":"http://example.org/carts/5/relationships/cart_purchases","related":"http://example.org/carts/5/cart_purchases"}}}},"included":[{"id":"5","type":"line_items","links":{"self":"http://example.org/line_items/5"},"attributes":{"cart_id":5,"sale_price":"5.0","list_price":"5.0","quantity":1,"created_at":"2017-09-25T22:11:02.850Z","updated_at":"2017-09-25T22:11:02.850Z","source_id":5,"source_type":"Item","source_sku":"IMASKU","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/5/relationships/cart","related":"http://example.org/line_items/5/cart"}}}}]}</pre>

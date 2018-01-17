# Cart API

## Show (with logged in cart owner)

### GET /carts/:id

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

<pre>GET /carts/10</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;27ea24aecf0df4ff1726d38b9dcabb87&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ae1f28e1-9cf0-49a5-aa01-c62429747109
X-Runtime: 0.045334
Content-Length: 529</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"10","type":"carts","links":{"self":"http://example.org/carts/10"},"attributes":{"user_id":1,"purchased_at":null,"created_at":"2018-01-17T19:36:04.841Z","updated_at":"2018-01-17T19:36:04.841Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/10/relationships/line_items","related":"http://example.org/carts/10/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/10/relationships/cart_purchases","related":"http://example.org/carts/10/cart_purchases"}}}}}</pre>

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

<pre>GET /carts/41</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;e2c249d55b0187c058e8b34f955eabb1&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 82f2b888-4aff-4c1a-829d-0c271368220a
X-Runtime: 0.075949
Content-Length: 530</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"41","type":"carts","links":{"self":"http://example.org/carts/41"},"attributes":{"user_id":18,"purchased_at":null,"created_at":"2018-02-28T15:46:47.465Z","updated_at":"2018-02-28T15:46:47.465Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/41/relationships/line_items","related":"http://example.org/carts/41/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/41/relationships/cart_purchases","related":"http://example.org/carts/41/cart_purchases"}}}}}</pre>

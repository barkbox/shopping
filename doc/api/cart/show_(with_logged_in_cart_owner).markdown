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

<pre>GET /carts/19</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;8f97be37b46223d1fae2783e9a820243&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a9195d0e-3705-4aad-92f7-d1a3b1c71501
X-Runtime: 0.029183
Content-Length: 530</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"19","type":"carts","links":{"self":"http://example.org/carts/19"},"attributes":{"user_id":13,"purchased_at":null,"created_at":"2018-05-14T06:13:02.554Z","updated_at":"2018-05-14T06:13:02.554Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/19/relationships/line_items","related":"http://example.org/carts/19/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/19/relationships/cart_purchases","related":"http://example.org/carts/19/cart_purchases"}}}}}</pre>

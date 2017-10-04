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

<pre>GET /carts/30</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;0fb82f222748068a8bccfead616de26b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8142d70a-905a-43db-ae32-d474adf761ce
X-Runtime: 0.053160
Content-Length: 529</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"30","type":"carts","links":{"self":"http://example.org/carts/30"},"attributes":{"user_id":6,"purchased_at":null,"created_at":"2017-10-04T20:56:53.143Z","updated_at":"2017-10-04T20:56:53.143Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/30/relationships/line_items","related":"http://example.org/carts/30/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/30/relationships/cart_purchases","related":"http://example.org/carts/30/cart_purchases"}}}}}</pre>

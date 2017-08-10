# Cart API

## Show

### GET /api/v1/carts/:id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| cart_id | Cart id | true |  |

### Request

#### Headers

<pre>Host: example.org
Cookie: </pre>

#### Route

<pre>GET /api/v1/carts/3</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;3f523a4c565536765e4eb5e7554a9e95&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 07c61987-04ad-400f-8a7d-9181e629f05c
X-Runtime: 0.040552
Content-Length: 558</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"3","type":"carts","links":{"self":"http://example.org/api/v1/carts/3"},"attributes":{"user_id":3,"purchased_at":null,"created_at":"2017-08-10T19:58:25.085Z","updated_at":"2017-08-10T19:58:25.085Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/api/v1/carts/3/relationships/line_items","related":"http://example.org/api/v1/carts/3/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/api/v1/carts/3/relationships/cart_purchases","related":"http://example.org/api/v1/carts/3/cart_purchases"}}}}}</pre>

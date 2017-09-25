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

<pre>GET /api/v1/carts/8</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;cfa20d8ead553c44656d134d6340f7d8&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a0a9794e-5997-48aa-9949-7016492db3df
X-Runtime: 0.051915
Content-Length: 558</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"8","type":"carts","links":{"self":"http://example.org/api/v1/carts/8"},"attributes":{"user_id":5,"purchased_at":null,"created_at":"2017-09-25T17:53:24.668Z","updated_at":"2017-09-25T17:53:24.668Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/api/v1/carts/8/relationships/line_items","related":"http://example.org/api/v1/carts/8/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/api/v1/carts/8/relationships/cart_purchases","related":"http://example.org/api/v1/carts/8/cart_purchases"}}}}}</pre>

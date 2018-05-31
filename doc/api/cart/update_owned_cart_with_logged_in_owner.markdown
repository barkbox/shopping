# Cart API

## Update owned cart with logged in owner

### PATCH /carts/:id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| id |  id | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /carts/25</pre>

#### Body

<pre>{"data":{"id":25,"type":"carts","attributes":{"user_id":1}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;3281298576463d141c2b84efbc658138&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: fce03a7c-d143-4518-a917-3426bcfbcec7
X-Runtime: 0.026008
Content-Length: 529</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"25","type":"carts","links":{"self":"http://example.org/carts/25"},"attributes":{"user_id":1,"purchased_at":null,"created_at":"2018-05-14T06:13:02.745Z","updated_at":"2018-05-14T06:13:02.753Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/25/relationships/line_items","related":"http://example.org/carts/25/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/25/relationships/cart_purchases","related":"http://example.org/carts/25/cart_purchases"}}}}}</pre>

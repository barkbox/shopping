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
ETag: W/&quot;06523c1c0ce4b894a4ec62dd6666944f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a8f50d59-22e7-421a-af66-cfcb8dcc1a6c
X-Runtime: 0.050870
Content-Length: 529</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"25","type":"carts","links":{"self":"http://example.org/carts/25"},"attributes":{"user_id":1,"purchased_at":null,"created_at":"2018-01-17T19:36:05.663Z","updated_at":"2018-01-17T19:36:05.693Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/25/relationships/line_items","related":"http://example.org/carts/25/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/25/relationships/cart_purchases","related":"http://example.org/carts/25/cart_purchases"}}}}}</pre>

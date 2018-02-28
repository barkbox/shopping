# Cart API

## logged in user with matching user_id

### GET /carts?filter[user_id]=:user_id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| user_id | User ID | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /carts?filter[user_id]=21</pre>

#### Query Parameters

<pre>filter: {&quot;user_id&quot;=&gt;&quot;21&quot;}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;2a9ed48ec92ab5c99252d54f67949887&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c245e75f-c215-4a03-a177-2a96c730a95b
X-Runtime: 0.061536
Content-Length: 532</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":[{"id":"44","type":"carts","links":{"self":"http://example.org/carts/44"},"attributes":{"user_id":21,"purchased_at":null,"created_at":"2018-02-28T15:46:47.613Z","updated_at":"2018-02-28T15:46:47.613Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/44/relationships/line_items","related":"http://example.org/carts/44/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/44/relationships/cart_purchases","related":"http://example.org/carts/44/cart_purchases"}}}}]}</pre>

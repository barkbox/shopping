# Cart API

## logged in user with existing carts with matching origin

### GET /carts?filter[origin]=:origin

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| origin | Origin | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /carts?filter[origin]=origin</pre>

#### Query Parameters

<pre>filter: {&quot;origin&quot;=&gt;&quot;origin&quot;}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;2e8cc7e1cc6e21a2a1d697dd6c810133&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 747ce5ea-7d2a-4829-b527-580177417fae
X-Runtime: 0.050682
Content-Length: 1048</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":[{"id":"8","type":"carts","links":{"self":"http://example.org/carts/8"},"attributes":{"user_id":7,"purchased_at":null,"created_at":"2018-05-14T07:13:02.227Z","updated_at":"2018-05-14T06:13:02.228Z","origin":"origin"},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/8/relationships/line_items","related":"http://example.org/carts/8/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/8/relationships/cart_purchases","related":"http://example.org/carts/8/cart_purchases"}}}},{"id":"7","type":"carts","links":{"self":"http://example.org/carts/7"},"attributes":{"user_id":7,"purchased_at":null,"created_at":"2018-05-14T06:13:02.219Z","updated_at":"2018-05-14T06:13:02.226Z","origin":"origin"},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/7/relationships/line_items","related":"http://example.org/carts/7/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/7/relationships/cart_purchases","related":"http://example.org/carts/7/cart_purchases"}}}}]}</pre>

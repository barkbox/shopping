# Cart API

## logged in admin with mismatched user_id

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

<pre>GET /carts?filter[user_id]=3</pre>

#### Query Parameters

<pre>filter: {&quot;user_id&quot;=&gt;&quot;3&quot;}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;119fcfa751f2e9a15507c5496ed2bca4&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d7b893b2-9d44-4a51-85e3-c9d271e0271c
X-Runtime: 0.056647
Content-Length: 525</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":[{"id":"3","type":"carts","links":{"self":"http://example.org/carts/3"},"attributes":{"user_id":3,"purchased_at":null,"created_at":"2018-05-14T06:13:02.068Z","updated_at":"2018-05-14T06:13:02.068Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/3/relationships/line_items","related":"http://example.org/carts/3/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/3/relationships/cart_purchases","related":"http://example.org/carts/3/cart_purchases"}}}}]}</pre>

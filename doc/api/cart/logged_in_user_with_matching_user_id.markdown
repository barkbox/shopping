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

<pre>GET /carts?filter[user_id]=4</pre>

#### Query Parameters

<pre>filter: {&quot;user_id&quot;=&gt;&quot;4&quot;}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;27a9dd2f80794066744b2409ca0cbff7&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 55cf358c-918b-4d68-9515-0f3f7230c07e
X-Runtime: 0.022529
Content-Length: 525</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":[{"id":"4","type":"carts","links":{"self":"http://example.org/carts/4"},"attributes":{"user_id":4,"purchased_at":null,"created_at":"2018-05-14T06:13:02.147Z","updated_at":"2018-05-14T06:13:02.147Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/4/relationships/line_items","related":"http://example.org/carts/4/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/4/relationships/cart_purchases","related":"http://example.org/carts/4/cart_purchases"}}}}]}</pre>

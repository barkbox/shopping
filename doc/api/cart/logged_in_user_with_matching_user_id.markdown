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

<pre>GET /carts?filter[user_id]=7</pre>

#### Query Parameters

<pre>filter: {&quot;user_id&quot;=&gt;&quot;7&quot;}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;f82f730967fc9f38941abf0557b4d523&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: beeaf897-a51c-4141-9a0e-0251a059f4ae
X-Runtime: 0.056486
Content-Length: 531</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":[{"id":"18","type":"carts","links":{"self":"http://example.org/carts/18"},"attributes":{"user_id":7,"purchased_at":null,"created_at":"2018-01-17T19:36:05.283Z","updated_at":"2018-01-17T19:36:05.283Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/18/relationships/line_items","related":"http://example.org/carts/18/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/18/relationships/cart_purchases","related":"http://example.org/carts/18/cart_purchases"}}}}]}</pre>

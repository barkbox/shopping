# Cart API

## with a logged in user with canceled carts

### GET /carts?filter[state]=canceled

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| state | State | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /carts?filter[state]=canceled</pre>

#### Query Parameters

<pre>filter: {&quot;state&quot;=&gt;&quot;canceled&quot;}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;4d515438b9b251b57dbfa0f08855aa98&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3a138b3c-fc84-4bcc-904d-19ee23173a45
X-Runtime: 0.036368
Content-Length: 554</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":[{"id":"30","type":"carts","links":{"self":"http://example.org/carts/30"},"attributes":{"user_id":18,"purchased_at":"2018-05-14T06:13:02.982Z","created_at":"2018-05-14T06:13:02.956Z","updated_at":"2018-05-14T06:13:02.982Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/30/relationships/line_items","related":"http://example.org/carts/30/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/30/relationships/cart_purchases","related":"http://example.org/carts/30/cart_purchases"}}}}]}</pre>

# Cart API

## with a logged in user with failed carts

### GET /carts?filter[state]=failed

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

<pre>GET /carts?filter[state]=failed</pre>

#### Query Parameters

<pre>filter: {&quot;state&quot;=&gt;&quot;failed&quot;}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;c892884e40ca3ae4bfc2e40aac483dde&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: dab4ef75-2f7b-453c-a23a-ba587e7a90e0
X-Runtime: 0.051088
Content-Length: 532</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":[{"id":"35","type":"carts","links":{"self":"http://example.org/carts/35"},"attributes":{"user_id":14,"purchased_at":null,"created_at":"2018-02-28T15:46:47.225Z","updated_at":"2018-02-28T15:46:47.244Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/35/relationships/line_items","related":"http://example.org/carts/35/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/35/relationships/cart_purchases","related":"http://example.org/carts/35/cart_purchases"}}}}]}</pre>

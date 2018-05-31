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
ETag: W/&quot;eb76a6d1902b3fa4e00634f85083ae64&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1346556c-e9bf-44f6-a552-430c96603b17
X-Runtime: 0.030302
Content-Length: 532</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":[{"id":"45","type":"carts","links":{"self":"http://example.org/carts/45"},"attributes":{"user_id":27,"purchased_at":null,"created_at":"2018-05-14T06:13:03.316Z","updated_at":"2018-05-14T06:13:03.324Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/45/relationships/line_items","related":"http://example.org/carts/45/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/45/relationships/cart_purchases","related":"http://example.org/carts/45/cart_purchases"}}}}]}</pre>

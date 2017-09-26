# Cart API

## Show

### GET /carts/:id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| cart_id | Cart ID | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /carts/2</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;c0c1faf8e3136d728caaec3985cc7680&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: fb0dc11c-738d-4781-9291-53caae862b31
X-Runtime: 0.054465
Content-Length: 523</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"2","type":"carts","links":{"self":"http://example.org/carts/2"},"attributes":{"user_id":2,"purchased_at":null,"created_at":"2017-09-26T14:27:55.168Z","updated_at":"2017-09-26T14:27:55.168Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/2/relationships/line_items","related":"http://example.org/carts/2/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/2/relationships/cart_purchases","related":"http://example.org/carts/2/cart_purchases"}}}}}</pre>

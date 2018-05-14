# Cart API

## Show (with logged in admin)

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

<pre>GET /carts/18</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;d9082fb09480a8d4b4558b0e9b914774&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8aa13baf-b7bb-4306-afe7-cf62a89a1bdc
X-Runtime: 0.036487
Content-Length: 530</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"18","type":"carts","links":{"self":"http://example.org/carts/18"},"attributes":{"user_id":12,"purchased_at":null,"created_at":"2018-05-14T06:13:02.505Z","updated_at":"2018-05-14T06:13:02.505Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/18/relationships/line_items","related":"http://example.org/carts/18/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/18/relationships/cart_purchases","related":"http://example.org/carts/18/cart_purchases"}}}}}</pre>

# Cart API

## Show

### GET /api/v1/carts/:id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| cart_id | Cart id | true |  |

### Request

#### Headers

<pre>Host: example.org
Cookie: </pre>

#### Route

<pre>GET /api/v1/carts/2</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;dfeac6512ba8173c57c41c84563db8c7&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: df942d94-44e5-403f-a89a-c6ac68698137
X-Runtime: 0.052835
Content-Length: 396</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"2","type":"carts","links":{"self":"http://example.org/api/v1/carts/2"},"attributes":{"user_id":2,"purchased_at":null,"created_at":"2017-07-25T14:34:51.237Z","updated_at":"2017-07-25T14:34:51.237Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/api/v1/carts/2/relationships/line_items","related":"http://example.org/api/v1/carts/2/line_items"}}}}}</pre>

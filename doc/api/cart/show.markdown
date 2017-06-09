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

<pre>GET /api/v1/carts/1</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;979d6c2f56234daaca730a384a7b14d7&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e47c4f34-314e-4aad-8d7c-29f214929393
X-Runtime: 0.062848
Content-Length: 382</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"1","type":"carts","links":{"self":"http://example.org/api/v1/carts/1"},"attributes":{"user_id":1,"purchased_at":null,"created_at":"2017-06-09T14:54:16.685Z","updated_at":"2017-06-09T14:54:16.685Z"},"relationships":{"line_items":{"links":{"self":"http://example.org/api/v1/carts/1/relationships/line_items","related":"http://example.org/api/v1/carts/1/line_items"}}}}}</pre>

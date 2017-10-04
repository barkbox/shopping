# Cart API

## Create with user and origin with logged in user

### POST /carts

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| origin | Origin | false | data[attributes] |
| user_id | User ID | false | data[attributes] |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /carts</pre>

#### Body

<pre>{"data":{"type":"carts","attributes":{"origin":"text","user_id":1}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
Location: http://example.org/carts/23
ETag: W/&quot;86c491beed207261c196b48f1c295a82&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a7750e59-c47a-4bb5-a013-80dcc1319c11
X-Runtime: 0.045458
Content-Length: 531</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"23","type":"carts","links":{"self":"http://example.org/carts/23"},"attributes":{"user_id":1,"purchased_at":null,"created_at":"2017-10-04T20:56:52.886Z","updated_at":"2017-10-04T20:56:52.886Z","origin":"text"},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/23/relationships/line_items","related":"http://example.org/carts/23/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/23/relationships/cart_purchases","related":"http://example.org/carts/23/cart_purchases"}}}}}</pre>

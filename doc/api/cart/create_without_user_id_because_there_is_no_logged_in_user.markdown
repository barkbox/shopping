# Cart API

## Create without user_id because there is no logged in user

### POST /carts

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| origin | Origin | true | data[attributes] |
| user_id | User ID | false | data[attributes] |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /carts</pre>

#### Body

<pre>{"data":{"type":"carts","attributes":{"origin":"text"}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
Location: http://example.org/carts/20
ETag: W/&quot;e0420b9ff2b1d8340ad645c9a0e3f02d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c1478669-3b02-42e8-8c7b-724b7811cf0a
X-Runtime: 0.050910
Content-Length: 534</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"20","type":"carts","links":{"self":"http://example.org/carts/20"},"attributes":{"user_id":null,"purchased_at":null,"created_at":"2018-02-28T15:46:46.548Z","updated_at":"2018-02-28T15:46:46.548Z","origin":"text"},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/20/relationships/line_items","related":"http://example.org/carts/20/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/20/relationships/cart_purchases","related":"http://example.org/carts/20/cart_purchases"}}}}}</pre>

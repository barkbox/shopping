# Cart API

## Create with user and origin

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
Location: http://example.org/carts/4
ETag: W/&quot;66a20149e015a1dd491718123ace5273&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 86765189-8022-43c4-b7c1-a4667fabeffe
X-Runtime: 0.059558
Content-Length: 525</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"4","type":"carts","links":{"self":"http://example.org/carts/4"},"attributes":{"user_id":1,"purchased_at":null,"created_at":"2017-09-26T14:27:55.257Z","updated_at":"2017-09-26T14:27:55.257Z","origin":"text"},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/4/relationships/line_items","related":"http://example.org/carts/4/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/4/relationships/cart_purchases","related":"http://example.org/carts/4/cart_purchases"}}}}}</pre>

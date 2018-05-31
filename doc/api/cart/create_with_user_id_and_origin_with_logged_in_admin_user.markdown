# Cart API

## Create with user_id and origin with logged in admin user

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

<pre>{"data":{"type":"carts","attributes":{"origin":"text","user_id":1}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
Location: http://example.org/carts/37
ETag: W/&quot;fa0bd60de61e7ebd98649cb2ddf84bfe&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 461c41b7-33e8-466c-85c9-55999ef85cab
X-Runtime: 0.053795
Content-Length: 531</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"37","type":"carts","links":{"self":"http://example.org/carts/37"},"attributes":{"user_id":1,"purchased_at":null,"created_at":"2018-05-14T06:13:03.108Z","updated_at":"2018-05-14T06:13:03.108Z","origin":"text"},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/37/relationships/line_items","related":"http://example.org/carts/37/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/37/relationships/cart_purchases","related":"http://example.org/carts/37/cart_purchases"}}}}}</pre>

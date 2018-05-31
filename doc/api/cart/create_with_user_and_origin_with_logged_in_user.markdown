# Cart API

## Create with user and origin with logged in user

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
Location: http://example.org/carts/40
ETag: W/&quot;68b86158fa599e0616e187e217527423&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 57e91a59-e629-4104-bd34-521b9e850a70
X-Runtime: 0.031122
Content-Length: 531</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"40","type":"carts","links":{"self":"http://example.org/carts/40"},"attributes":{"user_id":1,"purchased_at":null,"created_at":"2018-05-14T06:13:03.192Z","updated_at":"2018-05-14T06:13:03.192Z","origin":"text"},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/40/relationships/line_items","related":"http://example.org/carts/40/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/40/relationships/cart_purchases","related":"http://example.org/carts/40/cart_purchases"}}}}}</pre>

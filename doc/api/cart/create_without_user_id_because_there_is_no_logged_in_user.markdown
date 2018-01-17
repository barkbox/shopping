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
Location: http://example.org/carts/14
ETag: W/&quot;9e610bb57adc0c7dcf37bf1df89177ec&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: aafc71dd-29d1-4506-a154-cce175acb9c4
X-Runtime: 0.051466
Content-Length: 534</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"14","type":"carts","links":{"self":"http://example.org/carts/14"},"attributes":{"user_id":null,"purchased_at":null,"created_at":"2018-01-17T19:36:05.090Z","updated_at":"2018-01-17T19:36:05.090Z","origin":"text"},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/14/relationships/line_items","related":"http://example.org/carts/14/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/14/relationships/cart_purchases","related":"http://example.org/carts/14/cart_purchases"}}}}}</pre>

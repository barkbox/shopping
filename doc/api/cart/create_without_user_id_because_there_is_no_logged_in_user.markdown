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
Location: http://example.org/carts/42
ETag: W/&quot;8887d6bc81dd538897e0ae3abfa5f290&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b518314b-683c-4aaf-a116-c339c66604b8
X-Runtime: 0.033607
Content-Length: 534</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"42","type":"carts","links":{"self":"http://example.org/carts/42"},"attributes":{"user_id":null,"purchased_at":null,"created_at":"2018-05-14T06:13:03.247Z","updated_at":"2018-05-14T06:13:03.247Z","origin":"text"},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/42/relationships/line_items","related":"http://example.org/carts/42/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/42/relationships/cart_purchases","related":"http://example.org/carts/42/cart_purchases"}}}}}</pre>

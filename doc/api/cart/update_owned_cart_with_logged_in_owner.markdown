# Cart API

## Update owned cart with logged in owner

### PATCH /carts/:id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| id |  id | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /carts/26</pre>

#### Body

<pre>{"data":{"id":26,"type":"carts","attributes":{"user_id":1}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;c6b77e8d5825cb5b427c60c1d29ad888&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 144d2957-a3bf-4acc-ac95-b6aa58a37b44
X-Runtime: 0.071197
Content-Length: 529</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"26","type":"carts","links":{"self":"http://example.org/carts/26"},"attributes":{"user_id":1,"purchased_at":null,"created_at":"2018-02-28T15:46:46.835Z","updated_at":"2018-02-28T15:46:46.853Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/26/relationships/line_items","related":"http://example.org/carts/26/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/26/relationships/cart_purchases","related":"http://example.org/carts/26/cart_purchases"}}}}}</pre>

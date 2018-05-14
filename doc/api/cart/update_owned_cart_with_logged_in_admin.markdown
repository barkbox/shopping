# Cart API

## Update owned cart with logged in admin

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

<pre>PATCH /carts/24</pre>

#### Body

<pre>{"data":{"id":24,"type":"carts","attributes":{"user_id":1}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;e6285ec604cf3cc20f62bce97208f627&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4c93e4f6-44ba-47d8-8a21-089894eb9013
X-Runtime: 0.028146
Content-Length: 529</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"24","type":"carts","links":{"self":"http://example.org/carts/24"},"attributes":{"user_id":1,"purchased_at":null,"created_at":"2018-05-14T06:13:02.693Z","updated_at":"2018-05-14T06:13:02.705Z","origin":null},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/24/relationships/line_items","related":"http://example.org/carts/24/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/24/relationships/cart_purchases","related":"http://example.org/carts/24/cart_purchases"}}}}}</pre>

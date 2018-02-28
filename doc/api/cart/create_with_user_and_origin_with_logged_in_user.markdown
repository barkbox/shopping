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
Location: http://example.org/carts/22
ETag: W/&quot;dd5e2cbffa0410a2e7c37c8004ecfada&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 24517275-5a1e-4f0c-9b75-acc92dd72be6
X-Runtime: 0.074617
Content-Length: 531</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"22","type":"carts","links":{"self":"http://example.org/carts/22"},"attributes":{"user_id":1,"purchased_at":null,"created_at":"2018-02-28T15:46:46.612Z","updated_at":"2018-02-28T15:46:46.612Z","origin":"text"},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/22/relationships/line_items","related":"http://example.org/carts/22/line_items"}},"cart_purchases":{"links":{"self":"http://example.org/carts/22/relationships/cart_purchases","related":"http://example.org/carts/22/cart_purchases"}}}}}</pre>

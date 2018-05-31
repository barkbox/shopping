# Cart API

## logged in admin with muliple users logged with user filter param

### GET /carts?filter[origin]=add_to_box&amp;include=line_items&amp;filter[user_id]=:user_id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| user_id | User ID | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /carts?filter[origin]=add_to_box&amp;include=line_items&amp;filter[user_id]=8</pre>

#### Query Parameters

<pre>filter: {&quot;origin&quot;=&gt;&quot;add_to_box&quot;, &quot;user_id&quot;=&gt;&quot;8&quot;}
include: line_items</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;2be25b10ec6658b45c40d845cbb14b85&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 87372175-46eb-471a-aef7-e7e9f72c3956
X-Runtime: 0.049445
Content-Length: 549</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":[{"id":"10","type":"carts","links":{"self":"http://example.org/carts/10"},"attributes":{"user_id":8,"purchased_at":null,"created_at":"2018-05-14T06:13:02.293Z","updated_at":"2018-05-14T06:13:02.293Z","origin":"add_to_box"},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/10/relationships/line_items","related":"http://example.org/carts/10/line_items"},"data":[]},"cart_purchases":{"links":{"self":"http://example.org/carts/10/relationships/cart_purchases","related":"http://example.org/carts/10/cart_purchases"}}}}]}</pre>

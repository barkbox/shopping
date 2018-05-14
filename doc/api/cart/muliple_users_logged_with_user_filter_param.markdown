# Cart API

## muliple users logged with user filter param

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

<pre>GET /carts?filter[origin]=add_to_box&amp;include=line_items&amp;filter[user_id]=9</pre>

#### Query Parameters

<pre>filter: {&quot;origin&quot;=&gt;&quot;add_to_box&quot;, &quot;user_id&quot;=&gt;&quot;9&quot;}
include: line_items</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;bda5c4b1f69da075df9697a3faff8e6f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2c336e66-d9d9-4879-aa62-6c81d6719618
X-Runtime: 0.035735
Content-Length: 549</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":[{"id":"13","type":"carts","links":{"self":"http://example.org/carts/13"},"attributes":{"user_id":9,"purchased_at":null,"created_at":"2018-05-14T06:13:02.360Z","updated_at":"2018-05-14T06:13:02.360Z","origin":"add_to_box"},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/13/relationships/line_items","related":"http://example.org/carts/13/line_items"},"data":[]},"cart_purchases":{"links":{"self":"http://example.org/carts/13/relationships/cart_purchases","related":"http://example.org/carts/13/cart_purchases"}}}}]}</pre>

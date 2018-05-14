# Cart API

## muliple users logged without user filter parameter

### GET /carts?filter[origin]=add_to_box&amp;include=line_items
### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /carts?filter[origin]=add_to_box&amp;include=line_items</pre>

#### Query Parameters

<pre>filter: {&quot;origin&quot;=&gt;&quot;add_to_box&quot;}
include: line_items</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;7e6cd70d25db090ed7bf2e142c86b741&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 609c99d8-2104-4140-a858-58962d30a1fa
X-Runtime: 0.035757
Content-Length: 550</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":[{"id":"34","type":"carts","links":{"self":"http://example.org/carts/34"},"attributes":{"user_id":20,"purchased_at":null,"created_at":"2018-05-14T06:13:03.050Z","updated_at":"2018-05-14T06:13:03.050Z","origin":"add_to_box"},"relationships":{"line_items":{"links":{"self":"http://example.org/carts/34/relationships/line_items","related":"http://example.org/carts/34/line_items"},"data":[]},"cart_purchases":{"links":{"self":"http://example.org/carts/34/relationships/cart_purchases","related":"http://example.org/carts/34/cart_purchases"}}}}]}</pre>

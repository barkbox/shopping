# CartPurchase API

## Create

### POST /cart_purchases

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| cart_id | Data attributes cart | true | data[attributes] |
| options | Data attributes options | false | data[attributes] |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /cart_purchases</pre>

#### Body

<pre>{"data":{"type":"cart_purchases","attributes":{"cart_id":50}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
Location: http://example.org/cart_purchases/4
ETag: W/&quot;7fd51f9ccde1365682087512488bf982&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 14e10b6d-1902-4e43-8e25-1c770d890506
X-Runtime: 0.055264
Content-Length: 370</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"4","type":"cart_purchases","links":{"self":"http://example.org/cart_purchases/4"},"attributes":{"cart_id":50,"created_at":"2018-02-28T15:46:47.915Z","succeeded_at":null,"failed_at":null,"options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/cart_purchases/4/relationships/cart","related":"http://example.org/cart_purchases/4/cart"}}}}}</pre>

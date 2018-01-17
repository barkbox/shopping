# CartPurchase API

## owner is logged in

### GET /cart_purchases/:id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| cart_purchase_id | Cart Purchase ID | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /cart_purchases/5?cart_purchase_id=5</pre>

#### Query Parameters

<pre>cart_purchase_id: 5</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;c1e1729b33f326d9ba539189f9b876e0&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f87f54fe-f08e-4731-8c3f-b892f4922b32
X-Runtime: 0.071475
Content-Length: 369</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"5","type":"cart_purchases","links":{"self":"http://example.org/cart_purchases/5"},"attributes":{"cart_id":7,"created_at":"2018-01-17T19:36:04.670Z","succeeded_at":null,"failed_at":null,"options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/cart_purchases/5/relationships/cart","related":"http://example.org/cart_purchases/5/cart"}}}}}</pre>

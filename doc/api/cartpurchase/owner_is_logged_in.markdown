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

<pre>GET /cart_purchases/2?cart_purchase_id=2</pre>

#### Query Parameters

<pre>cart_purchase_id: 2</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;41704833b103dc403ff1931e86c83df0&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2d10df0f-2a61-4e8c-9de2-2eef0c385036
X-Runtime: 0.030779
Content-Length: 369</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"2","type":"cart_purchases","links":{"self":"http://example.org/cart_purchases/2"},"attributes":{"cart_id":5,"created_at":"2017-10-04T20:56:52.151Z","succeeded_at":null,"failed_at":null,"options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/cart_purchases/2/relationships/cart","related":"http://example.org/cart_purchases/2/cart"}}}}}</pre>

# CartPurchase API

## admin is logged in

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

<pre>GET /cart_purchases/3?cart_purchase_id=3</pre>

#### Query Parameters

<pre>cart_purchase_id: 3</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;b4c16bfef1ba3fc20d0cb2ef38a64b03&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ce717985-684e-4a71-8a2c-a6d92bba5287
X-Runtime: 0.018672
Content-Length: 389</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"3","type":"cart_purchases","links":{"self":"http://example.org/cart_purchases/3"},"attributes":{"cart_id":49,"created_at":"2018-05-14T06:13:03.432Z","succeeded_at":null,"failed_at":null,"canceled_at":null,"options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/cart_purchases/3/relationships/cart","related":"http://example.org/cart_purchases/3/cart"}}}}}</pre>

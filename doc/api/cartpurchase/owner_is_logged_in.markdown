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
ETag: W/&quot;f4b9339afd176aae0909b2701a102e30&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 9f0cba6e-9cfb-496c-9b31-16baf5f55554
X-Runtime: 0.064673
Content-Length: 370</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"5","type":"cart_purchases","links":{"self":"http://example.org/cart_purchases/5"},"attributes":{"cart_id":51,"created_at":"2018-02-28T15:46:47.966Z","succeeded_at":null,"failed_at":null,"options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/cart_purchases/5/relationships/cart","related":"http://example.org/cart_purchases/5/cart"}}}}}</pre>

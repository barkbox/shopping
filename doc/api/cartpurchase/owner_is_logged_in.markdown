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
ETag: W/&quot;03ac7e133c2741c1c27963a133a3bd62&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 01072a95-ffb2-464d-9bd5-9188a5372be3
X-Runtime: 0.036406
Content-Length: 389</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"2","type":"cart_purchases","links":{"self":"http://example.org/cart_purchases/2"},"attributes":{"cart_id":48,"created_at":"2018-05-14T06:13:03.383Z","succeeded_at":null,"failed_at":null,"canceled_at":null,"options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/cart_purchases/2/relationships/cart","related":"http://example.org/cart_purchases/2/cart"}}}}}</pre>

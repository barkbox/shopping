# CartPurchase API

## Create

### POST /api/v1/cart_purchases

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| cart_id | Data attributes cart | true | data[attributes] |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /api/v1/cart_purchases</pre>

#### Body

<pre>{"data":{"type":"cart_purchases","attributes":{"cart_id":3}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
Location: http://example.org/api/v1/cart_purchases/1
ETag: W/&quot;006f475dea9bda3e8a7567891a8df10e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4e363af9-d55f-4a7f-a30e-966427f2a691
X-Runtime: 0.118564
Content-Length: 377</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"1","type":"cart_purchases","links":{"self":"http://example.org/api/v1/cart_purchases/1"},"attributes":{"cart_id":3,"created_at":"2017-09-25T17:53:24.389Z","succeeded_at":null,"failed_at":null},"relationships":{"cart":{"links":{"self":"http://example.org/api/v1/cart_purchases/1/relationships/cart","related":"http://example.org/api/v1/cart_purchases/1/cart"}}}}}</pre>

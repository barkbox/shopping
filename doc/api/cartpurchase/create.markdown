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

<pre>{"data":{"type":"cart_purchases","attributes":{"cart_id":4}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
Location: http://example.org/cart_purchases/1
ETag: W/&quot;5b49d642d63eec38370775b0e70f6185&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 18b48749-c87b-41a2-8741-25702d2a6635
X-Runtime: 0.076468
Content-Length: 369</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"1","type":"cart_purchases","links":{"self":"http://example.org/cart_purchases/1"},"attributes":{"cart_id":4,"created_at":"2017-10-04T20:56:52.100Z","succeeded_at":null,"failed_at":null,"options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/cart_purchases/1/relationships/cart","related":"http://example.org/cart_purchases/1/cart"}}}}}</pre>

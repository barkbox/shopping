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

<pre>{"data":{"type":"cart_purchases","attributes":{"cart_id":6}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
Location: http://example.org/cart_purchases/4
ETag: W/&quot;d7700d329a7bafa8d168c27dbc3c254a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f4a46041-1d19-44f2-834a-51d96030f70b
X-Runtime: 0.073459
Content-Length: 369</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"4","type":"cart_purchases","links":{"self":"http://example.org/cart_purchases/4"},"attributes":{"cart_id":6,"created_at":"2018-01-17T19:36:04.600Z","succeeded_at":null,"failed_at":null,"options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/cart_purchases/4/relationships/cart","related":"http://example.org/cart_purchases/4/cart"}}}}}</pre>

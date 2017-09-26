# CartPurchase API

## Create

### POST /cart_purchases

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

<pre>POST /cart_purchases</pre>

#### Body

<pre>{"data":{"type":"cart_purchases","attributes":{"cart_id":10}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
Location: http://example.org/cart_purchases/1
ETag: W/&quot;3a5d90428c9ffc0db6224c854dc03e88&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 012b3ac9-1425-4e27-acf6-974b4388c5dd
X-Runtime: 0.082254
Content-Length: 357</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"1","type":"cart_purchases","links":{"self":"http://example.org/cart_purchases/1"},"attributes":{"cart_id":10,"created_at":"2017-09-26T14:27:55.618Z","succeeded_at":null,"failed_at":null},"relationships":{"cart":{"links":{"self":"http://example.org/cart_purchases/1/relationships/cart","related":"http://example.org/cart_purchases/1/cart"}}}}}</pre>

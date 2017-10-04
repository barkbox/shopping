# LineItem API

## Find with an owned cart and logged in owner

### GET /line_items/:id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| id |  id | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /line_items/10</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;05ca3089ff0b52e8a4438919deae2aac&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 39a431f7-5885-4228-82b1-5aad97c9894f
X-Runtime: 0.035557
Content-Length: 470</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"10","type":"line_items","links":{"self":"http://example.org/line_items/10"},"attributes":{"cart_id":19,"sale_price":"5.0","list_price":"5.0","quantity":1,"created_at":"2017-10-04T20:56:52.733Z","updated_at":"2017-10-04T20:56:52.733Z","source_id":12,"source_type":"Item","source_sku":"IMASKU","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/10/relationships/cart","related":"http://example.org/line_items/10/cart"}}}}}</pre>

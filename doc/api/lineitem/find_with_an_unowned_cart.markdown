# LineItem API

## Find with an unowned cart

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

<pre>GET /line_items/11</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;9c924e53e89a19ab4aaa67199a6e5688&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 578a753c-0180-4de3-afeb-8d30834c2045
X-Runtime: 0.035848
Content-Length: 470</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"11","type":"line_items","links":{"self":"http://example.org/line_items/11"},"attributes":{"cart_id":20,"sale_price":"5.0","list_price":"5.0","quantity":1,"created_at":"2017-10-04T20:56:52.790Z","updated_at":"2017-10-04T20:56:52.790Z","source_id":13,"source_type":"Item","source_sku":"IMASKU","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/11/relationships/cart","related":"http://example.org/line_items/11/cart"}}}}}</pre>

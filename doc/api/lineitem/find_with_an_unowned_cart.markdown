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

<pre>GET /line_items/35</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;9cf385634aef1e635f3bee7a56bc14ce&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a020e84a-d1fa-4d0a-bab0-6e0cb9439b34
X-Runtime: 0.021927
Content-Length: 494</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"35","type":"line_items","links":{"self":"http://example.org/line_items/35"},"attributes":{"cart_id":60,"sale_price":"5.0","list_price":"5.0","quantity":1,"created_at":"2018-05-14T06:13:03.727Z","updated_at":"2018-05-14T06:13:03.727Z","source_id":35,"source_type":"Item","source_sku":"IMASKU","source_name":"An Item","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/35/relationships/cart","related":"http://example.org/line_items/35/cart"}}}}}</pre>

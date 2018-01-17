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

<pre>GET /line_items/24</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;5927d00a62e123c6d3cbf6f048dc9447&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1c859afd-571e-43c3-a86b-8d2b680b996d
X-Runtime: 0.084355
Content-Length: 470</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"24","type":"line_items","links":{"self":"http://example.org/line_items/24"},"attributes":{"cart_id":39,"sale_price":"5.0","list_price":"5.0","quantity":1,"created_at":"2018-01-17T19:36:06.429Z","updated_at":"2018-01-17T19:36:06.429Z","source_id":24,"source_type":"Item","source_sku":"IMASKU","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/24/relationships/cart","related":"http://example.org/line_items/24/cart"}}}}}</pre>

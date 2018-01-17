# LineItem API

## Update with unowned cart

### PATCH /line_items/:id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| id | Line item id | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /line_items/32</pre>

#### Body

<pre>{"data":{"id":32,"type":"line_items","attributes":{"quantity":2}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;c941297ec3d5d44424314ed91a806a88&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f46d52d0-59de-4108-a831-796031d8bb89
X-Runtime: 0.077533
Content-Length: 470</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"32","type":"line_items","links":{"self":"http://example.org/line_items/32"},"attributes":{"cart_id":50,"sale_price":"5.0","list_price":"5.0","quantity":2,"created_at":"2018-01-17T19:36:07.140Z","updated_at":"2018-01-17T19:36:07.173Z","source_id":35,"source_type":"Item","source_sku":"IMASKU","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/32/relationships/cart","related":"http://example.org/line_items/32/cart"}}}}}</pre>

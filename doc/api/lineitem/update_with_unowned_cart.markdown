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

<pre>PATCH /line_items/55</pre>

#### Body

<pre>{"data":{"id":55,"type":"line_items","attributes":{"quantity":2}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;d257f9a7b51a8bac66b90f6b9f686c00&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b13031ed-b29f-4c67-9e1e-de1e27029f8a
X-Runtime: 0.026310
Content-Length: 494</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"55","type":"line_items","links":{"self":"http://example.org/line_items/55"},"attributes":{"cart_id":83,"sale_price":"5.0","list_price":"5.0","quantity":2,"created_at":"2018-05-14T06:13:04.536Z","updated_at":"2018-05-14T06:13:04.543Z","source_id":58,"source_type":"Item","source_sku":"IMASKU","source_name":"An Item","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/55/relationships/cart","related":"http://example.org/line_items/55/cart"}}}}}</pre>

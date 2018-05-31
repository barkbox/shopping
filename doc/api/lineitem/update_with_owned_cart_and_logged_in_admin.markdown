# LineItem API

## Update with owned cart and logged in admin

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

<pre>PATCH /line_items/54</pre>

#### Body

<pre>{"data":{"id":54,"type":"line_items","attributes":{"quantity":2}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;ff1d0054e774ca854966af4c113f7bdf&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 04c1d6da-a83e-4d9d-9b4a-42f89f1b4bb9
X-Runtime: 0.022854
Content-Length: 494</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"54","type":"line_items","links":{"self":"http://example.org/line_items/54"},"attributes":{"cart_id":82,"sale_price":"5.0","list_price":"5.0","quantity":2,"created_at":"2018-05-14T06:13:04.494Z","updated_at":"2018-05-14T06:13:04.503Z","source_id":57,"source_type":"Item","source_sku":"IMASKU","source_name":"An Item","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/54/relationships/cart","related":"http://example.org/line_items/54/cart"}}}}}</pre>

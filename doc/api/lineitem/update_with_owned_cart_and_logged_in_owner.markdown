# LineItem API

## Update with owned cart and logged in owner

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

<pre>PATCH /line_items/56</pre>

#### Body

<pre>{"data":{"id":56,"type":"line_items","attributes":{"quantity":2}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;e3f82fc17cabd5380f7f9f7f1ce1785e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2e65688e-79d4-4fa3-bc88-c1400cc00a0d
X-Runtime: 0.037802
Content-Length: 494</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"56","type":"line_items","links":{"self":"http://example.org/line_items/56"},"attributes":{"cart_id":84,"sale_price":"5.0","list_price":"5.0","quantity":2,"created_at":"2018-05-14T06:13:04.587Z","updated_at":"2018-05-14T06:13:04.602Z","source_id":59,"source_type":"Item","source_sku":"IMASKU","source_name":"An Item","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/56/relationships/cart","related":"http://example.org/line_items/56/cart"}}}}}</pre>

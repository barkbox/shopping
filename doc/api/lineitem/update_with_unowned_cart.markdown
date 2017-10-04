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

<pre>PATCH /line_items/3</pre>

#### Body

<pre>{"data":{"id":3,"type":"line_items","attributes":{"quantity":2}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;5cbfad26e0058537a41ecbf19f2f6d4d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: bea954f5-706e-49b9-b3be-519d759cd58d
X-Runtime: 0.038078
Content-Length: 465</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"3","type":"line_items","links":{"self":"http://example.org/line_items/3"},"attributes":{"cart_id":10,"sale_price":"5.0","list_price":"5.0","quantity":2,"created_at":"2017-10-04T20:56:52.398Z","updated_at":"2017-10-04T20:56:52.405Z","source_id":3,"source_type":"Item","source_sku":"IMASKU","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/3/relationships/cart","related":"http://example.org/line_items/3/cart"}}}}}</pre>

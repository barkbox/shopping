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

<pre>PATCH /line_items/5</pre>

#### Body

<pre>{"data":{"id":5,"type":"line_items","attributes":{"quantity":2}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;4c6a2ad965097c036803fb48ef6c74af&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 44057221-ade6-4475-bf52-b4a4fe867985
X-Runtime: 0.068653
Content-Length: 488</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"5","type":"line_items","links":{"self":"http://example.org/line_items/5"},"attributes":{"cart_id":8,"sale_price":"5.0","list_price":"5.0","quantity":2,"created_at":"2018-02-28T15:46:45.932Z","updated_at":"2018-02-28T15:46:45.941Z","source_id":8,"source_type":"Item","source_sku":"IMASKU","source_name":"An Item","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/5/relationships/cart","related":"http://example.org/line_items/5/cart"}}}}}</pre>

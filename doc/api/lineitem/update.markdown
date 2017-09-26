# LineItem API

## Update

### PUT /line_items/:id

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

<pre>PUT /line_items/7</pre>

#### Body

<pre>{"data":{"id":7,"type":"line_items","attributes":{"quantity":2}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;74b99b70676642220de4ccd81eea0911&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 417ca07b-9f57-4b1c-8589-8f8b311c3b80
X-Runtime: 0.048853
Content-Length: 464</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"7","type":"line_items","links":{"self":"http://example.org/line_items/7"},"attributes":{"cart_id":8,"sale_price":"5.0","list_price":"5.0","quantity":2,"created_at":"2017-09-26T14:27:55.494Z","updated_at":"2017-09-26T14:27:55.503Z","source_id":7,"source_type":"Item","source_sku":"IMASKU","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/7/relationships/cart","related":"http://example.org/line_items/7/cart"}}}}}</pre>

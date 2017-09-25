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

<pre>PUT /line_items/2</pre>

#### Body

<pre>{"data":{"id":2,"type":"line_items","attributes":{"quantity":2}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;1bc0f55ab35213718162ed77486259f3&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 152c9ca9-99e6-420a-b070-1fa37b6ad679
X-Runtime: 0.043240
Content-Length: 464</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"2","type":"line_items","links":{"self":"http://example.org/line_items/2"},"attributes":{"cart_id":2,"sale_price":"5.0","list_price":"5.0","quantity":2,"created_at":"2017-09-25T22:11:02.710Z","updated_at":"2017-09-25T22:11:02.720Z","source_id":2,"source_type":"Item","source_sku":"IMASKU","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/2/relationships/cart","related":"http://example.org/line_items/2/cart"}}}}}</pre>

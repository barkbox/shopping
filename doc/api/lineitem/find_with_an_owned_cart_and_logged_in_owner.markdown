# LineItem API

## Find with an owned cart and logged in owner

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

<pre>GET /line_items/10</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;777a772d7c7e0019e041371d4f5c2b30&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 0ac50baa-2c00-44ea-9c3a-921e4027fcb1
X-Runtime: 0.056054
Content-Length: 494</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"10","type":"line_items","links":{"self":"http://example.org/line_items/10"},"attributes":{"cart_id":13,"sale_price":"5.0","list_price":"5.0","quantity":1,"created_at":"2018-02-28T15:46:46.234Z","updated_at":"2018-02-28T15:46:46.234Z","source_id":13,"source_type":"Item","source_sku":"IMASKU","source_name":"An Item","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/10/relationships/cart","related":"http://example.org/line_items/10/cart"}}}}}</pre>

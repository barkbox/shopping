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

<pre>PATCH /line_items/4</pre>

#### Body

<pre>{"data":{"id":4,"type":"line_items","attributes":{"quantity":2}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;9f53daa44103c1ba2e164f0c9fcac16a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c1e60639-9040-4c90-9d73-89a79643874a
X-Runtime: 0.074562
Content-Length: 488</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"4","type":"line_items","links":{"self":"http://example.org/line_items/4"},"attributes":{"cart_id":7,"sale_price":"5.0","list_price":"5.0","quantity":2,"created_at":"2018-02-28T15:46:45.825Z","updated_at":"2018-02-28T15:46:45.863Z","source_id":7,"source_type":"Item","source_sku":"IMASKU","source_name":"An Item","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/4/relationships/cart","related":"http://example.org/line_items/4/cart"}}}}}</pre>

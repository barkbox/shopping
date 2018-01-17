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

<pre>PATCH /line_items/33</pre>

#### Body

<pre>{"data":{"id":33,"type":"line_items","attributes":{"quantity":2}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;8f1925f7505c19057fa82a6953f36c41&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 81c58614-d0d4-4fc6-936d-1ad3cca62e10
X-Runtime: 0.074988
Content-Length: 470</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"33","type":"line_items","links":{"self":"http://example.org/line_items/33"},"attributes":{"cart_id":51,"sale_price":"5.0","list_price":"5.0","quantity":2,"created_at":"2018-01-17T19:36:07.232Z","updated_at":"2018-01-17T19:36:07.256Z","source_id":36,"source_type":"Item","source_sku":"IMASKU","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/33/relationships/cart","related":"http://example.org/line_items/33/cart"}}}}}</pre>

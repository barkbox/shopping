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

<pre>PATCH /line_items/2</pre>

#### Body

<pre>{"data":{"id":2,"type":"line_items","attributes":{"quantity":2}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;b64202c24e45aff10e2320cdc30e2f78&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 089a12d6-1229-463c-8925-90acba277873
X-Runtime: 0.045325
Content-Length: 464</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"2","type":"line_items","links":{"self":"http://example.org/line_items/2"},"attributes":{"cart_id":9,"sale_price":"5.0","list_price":"5.0","quantity":2,"created_at":"2017-10-04T20:56:52.335Z","updated_at":"2017-10-04T20:56:52.345Z","source_id":2,"source_type":"Item","source_sku":"IMASKU","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/2/relationships/cart","related":"http://example.org/line_items/2/cart"}}}}}</pre>

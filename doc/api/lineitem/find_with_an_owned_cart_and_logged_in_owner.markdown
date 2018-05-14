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

<pre>GET /line_items/34</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;53ac3ccd54cac33bfbe1b70d730717c5&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: cc8cb35f-327f-443b-93a2-c8d49740008f
X-Runtime: 0.035664
Content-Length: 494</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"34","type":"line_items","links":{"self":"http://example.org/line_items/34"},"attributes":{"cart_id":59,"sale_price":"5.0","list_price":"5.0","quantity":1,"created_at":"2018-05-14T06:13:03.676Z","updated_at":"2018-05-14T06:13:03.676Z","source_id":34,"source_type":"Item","source_sku":"IMASKU","source_name":"An Item","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/34/relationships/cart","related":"http://example.org/line_items/34/cart"}}}}}</pre>

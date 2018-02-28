# LineItem API

## Find with an unowned cart

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

<pre>GET /line_items/9</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;097864aeabef76b8bbe81a2072c71bdf&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ea9be3fe-07cd-4cd2-ab8a-93f82220ed4b
X-Runtime: 0.039075
Content-Length: 490</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"9","type":"line_items","links":{"self":"http://example.org/line_items/9"},"attributes":{"cart_id":12,"sale_price":"5.0","list_price":"5.0","quantity":1,"created_at":"2018-02-28T15:46:46.176Z","updated_at":"2018-02-28T15:46:46.176Z","source_id":12,"source_type":"Item","source_sku":"IMASKU","source_name":"An Item","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/9/relationships/cart","related":"http://example.org/line_items/9/cart"}}}}}</pre>

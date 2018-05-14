# LineItem API

## Find with an owned cart and logged in admin

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

<pre>GET /line_items/38</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;43dca34285019e53a51e8e89a30647f0&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: bc87fb1f-3142-4983-9eab-4270d0659607
X-Runtime: 0.023644
Content-Length: 494</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"38","type":"line_items","links":{"self":"http://example.org/line_items/38"},"attributes":{"cart_id":63,"sale_price":"5.0","list_price":"5.0","quantity":1,"created_at":"2018-05-14T06:13:03.811Z","updated_at":"2018-05-14T06:13:03.811Z","source_id":38,"source_type":"Item","source_sku":"IMASKU","source_name":"An Item","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/38/relationships/cart","related":"http://example.org/line_items/38/cart"}}}}}</pre>

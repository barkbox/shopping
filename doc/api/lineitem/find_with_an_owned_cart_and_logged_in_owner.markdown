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

<pre>GET /line_items/26</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/&quot;c4f3d778209081f9300e7794a703dcf4&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c258e8eb-1feb-408e-b924-def9710e3771
X-Runtime: 0.052537
Content-Length: 470</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{"data":{"id":"26","type":"line_items","links":{"self":"http://example.org/line_items/26"},"attributes":{"cart_id":41,"sale_price":"5.0","list_price":"5.0","quantity":1,"created_at":"2018-01-17T19:36:06.595Z","updated_at":"2018-01-17T19:36:06.595Z","source_id":26,"source_type":"Item","source_sku":"IMASKU","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/26/relationships/cart","related":"http://example.org/line_items/26/cart"}}}}}</pre>

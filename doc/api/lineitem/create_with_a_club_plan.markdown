# LineItem API

## Create with a club plan

### POST /line_items

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| cart_id | Data attributes cart | true | data[attributes] |
| source_id | Data attributes source | true | data[attributes] |
| source_type | Data attributes source type | true | data[attributes] |
| sale_price | Data attributes sale price | true | data[attributes] |
| list_price | Data attributes list price | true | data[attributes] |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /line_items</pre>

#### Body

<pre>{"data":{"attributes":{"cart_id":43,"source_id":28,"source_type":"Item","options":{"club":"extra-toy"}},"type":"line_items"}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
Location: http://example.org/line_items/28
ETag: W/&quot;7445707261d2b20f0af15ec619c4a8c8&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 86696768-1187-4d83-b616-babfceca921c
X-Runtime: 0.065508
Content-Length: 471</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"28","type":"line_items","links":{"self":"http://example.org/line_items/28"},"attributes":{"cart_id":43,"sale_price":null,"list_price":null,"quantity":null,"created_at":"2018-01-17T19:36:06.751Z","updated_at":"2018-01-17T19:36:06.751Z","source_id":29,"source_type":"Item","source_sku":"IMASKU","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/28/relationships/cart","related":"http://example.org/line_items/28/cart"}}}}}</pre>

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

<pre>{"data":{"attributes":{"cart_id":75,"source_id":50,"source_type":"Item","options":{"club":"extra-toy"}},"type":"line_items"}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
Location: http://example.org/line_items/50
ETag: W/&quot;90b8cb681dde7484bd685f9c2bd311f6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 34d614b8-a25d-4de4-a2cc-2ead8f16c22b
X-Runtime: 0.034947
Content-Length: 497</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"50","type":"line_items","links":{"self":"http://example.org/line_items/50"},"attributes":{"cart_id":75,"sale_price":"5.0","list_price":"5.0","quantity":null,"created_at":"2018-05-14T06:13:04.249Z","updated_at":"2018-05-14T06:13:04.249Z","source_id":51,"source_type":"Item","source_sku":"IMASKU","source_name":"An Item","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/50/relationships/cart","related":"http://example.org/line_items/50/cart"}}}}}</pre>

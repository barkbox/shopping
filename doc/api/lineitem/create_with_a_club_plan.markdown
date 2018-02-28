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

<pre>{"data":{"attributes":{"cart_id":2,"source_id":2,"source_type":"Item","options":{"club":"extra-toy"}},"type":"line_items"}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
Location: http://example.org/line_items/2
ETag: W/&quot;91e663ceca4b96f4dec102a9b75618c7&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b52af5d3-61ae-4b50-9595-2ded5859eeae
X-Runtime: 0.076967
Content-Length: 491</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{"data":{"id":"2","type":"line_items","links":{"self":"http://example.org/line_items/2"},"attributes":{"cart_id":2,"sale_price":"5.0","list_price":"5.0","quantity":null,"created_at":"2018-02-28T15:46:45.642Z","updated_at":"2018-02-28T15:46:45.642Z","source_id":3,"source_type":"Item","source_sku":"IMASKU","source_name":"An Item","options":{}},"relationships":{"cart":{"links":{"self":"http://example.org/line_items/2/relationships/cart","related":"http://example.org/line_items/2/cart"}}}}}</pre>

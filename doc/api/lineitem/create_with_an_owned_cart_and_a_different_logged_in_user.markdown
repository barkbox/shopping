# LineItem API

## Create with an owned cart and a different logged in user

### POST /carts/:cart_id/line_items

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
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

<pre>POST /carts/96/line_items</pre>

#### Body

<pre>{"data":{"type":"line_items","attributes":{"cart_id":96,"source_id":71,"source_type":"Item","sale_price":1.0,"list_price":1.0}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: 67a377f8-64fe-4e73-9ab6-cf7758360e9d
X-Runtime: 0.003896
Content-Length: 141</pre>

#### Status

<pre>403 Forbidden</pre>

#### Body

<pre>{
  "errors": [
    {
      "title": "Create Forbidden",
      "detail": "You don't have permission to create this shopping/line item.",
      "code": "403",
      "status": "403"
    }
  ]
}</pre>

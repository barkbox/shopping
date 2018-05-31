# LineItem API

## Create with an owned cart and no logged in user

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

<pre>POST /carts/97/line_items</pre>

#### Body

<pre>{"data":{"type":"line_items","attributes":{"cart_id":97,"source_id":72,"source_type":"Item","sale_price":1.0,"list_price":1.0}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: fe6b4905-88c0-4ca7-9dba-5939231fa4e4
X-Runtime: 0.003634
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

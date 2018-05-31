# LineItem API

## Find line_items with an owned cart and logged in non-owner

### GET /carts/:cart_id/line_items

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| id |  id | true |  |
| cart_id |  cart | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /carts/72/line_items?id=47</pre>

#### Query Parameters

<pre>id: 47</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: f2ad734b-50cb-479a-8cc0-023cb3c37e25
X-Runtime: 0.007497
Content-Length: 134</pre>

#### Status

<pre>403 Forbidden</pre>

#### Body

<pre>{
  "errors": [
    {
      "title": "Index Forbidden",
      "detail": "You don't have permission to index this shopping/cart.",
      "code": "403",
      "status": "403"
    }
  ]
}</pre>

# Cart API

## logged in user is not owner of cart

### GET /carts/:id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| cart_id | Cart ID | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /carts/12</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: d96d59a3-b6e6-4fe8-859e-0466ed86e8be
X-Runtime: 0.015010
Content-Length: 132</pre>

#### Status

<pre>403 Forbidden</pre>

#### Body

<pre>{
  "errors": [
    {
      "title": "Show Forbidden",
      "detail": "You don't have permission to show this shopping/cart.",
      "code": "403",
      "status": "403"
    }
  ]
}</pre>

# CartPurchase API

## no one is logged in

### GET /cart_purchases/:id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| cart_purchase_id | Cart Purchase ID | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /cart_purchases/4</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: c48fe726-d20a-477f-abcb-35d498dab04a
X-Runtime: 0.006489
Content-Length: 141</pre>

#### Status

<pre>403 Forbidden</pre>

#### Body

<pre>{
  "errors": [
    {
      "title": "Show Forbidden",
      "detail": "You don't have permission to show this shopping/cart purchase.",
      "code": "403",
      "status": "403"
    }
  ]
}</pre>

# Cart API

## with a logged out user

### GET /carts?filter[state]=open

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| state | State | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /carts?filter[state]=open</pre>

#### Query Parameters

<pre>filter: {&quot;state&quot;=&gt;&quot;open&quot;}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: f328c202-cbc0-45b5-8f96-35b83ac7ca29
X-Runtime: 0.001892
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

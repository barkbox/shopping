# Cart API

## logged out user

### GET /carts?filter[origin]=:origin

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| origin | Origin | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /carts?filter[origin]=origin</pre>

#### Query Parameters

<pre>filter: {&quot;origin&quot;=&gt;&quot;origin&quot;}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: c17469bd-4aa1-4d36-851f-173bb942e391
X-Runtime: 0.003579
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

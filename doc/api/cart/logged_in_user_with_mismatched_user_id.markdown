# Cart API

## logged in user with mismatched user_id

### GET /carts?filter[user_id]=:user_id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| user_id | User ID | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /carts?filter[user_id]=8</pre>

#### Query Parameters

<pre>filter: {&quot;user_id&quot;=&gt;&quot;8&quot;}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: ba7c6dd7-0e9d-40d7-b197-5e8d4ff0e016
X-Runtime: 0.005231
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

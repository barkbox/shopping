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

<pre>GET /carts?filter[user_id]=2</pre>

#### Query Parameters

<pre>filter: {&quot;user_id&quot;=&gt;&quot;2&quot;}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: 0d88c0f1-719b-4d28-9cc6-e09daa861adb
X-Runtime: 0.002573
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

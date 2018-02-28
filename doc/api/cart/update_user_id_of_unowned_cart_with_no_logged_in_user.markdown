# Cart API

## Update user id of unowned cart with no logged in user

### PATCH /carts/:id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| id |  id | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /carts/25</pre>

#### Body

<pre>{"data":{"id":25,"type":"carts","attributes":{"user_id":1}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: b7c8c4ed-51f9-44fb-aeba-c734e7136816
X-Runtime: 0.005383
Content-Length: 136</pre>

#### Status

<pre>403 Forbidden</pre>

#### Body

<pre>{
  "errors": [
    {
      "title": "Update Forbidden",
      "detail": "You don't have permission to update this shopping/cart.",
      "code": "403",
      "status": "403"
    }
  ]
}</pre>

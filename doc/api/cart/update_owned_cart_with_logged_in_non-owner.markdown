# Cart API

## Update owned cart with logged in non-owner

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

<pre>PATCH /carts/29</pre>

#### Body

<pre>{"data":{"id":29,"type":"carts","attributes":{"user_id":1}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: 9cd4a8bc-b2af-4c6d-bcb5-4d07b46d226b
X-Runtime: 0.006573
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

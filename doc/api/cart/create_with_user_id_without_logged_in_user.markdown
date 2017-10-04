# Cart API

## Create with user_id without logged in user

### POST /carts

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| origin | Origin | false | data[attributes] |
| user_id | User ID | false | data[attributes] |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /carts</pre>

#### Body

<pre>{"data":{"type":"carts","attributes":{"origin":"text","user_id":1}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: d310461e-9cae-443c-8191-82efe46c4cec
X-Runtime: 0.010510
Content-Length: 136</pre>

#### Status

<pre>403 Forbidden</pre>

#### Body

<pre>{
  "errors": [
    {
      "title": "Create Forbidden",
      "detail": "You don't have permission to create this shopping/cart.",
      "code": "403",
      "status": "403"
    }
  ]
}</pre>
# LineItem API

## Find with an owned cart and no logged in user

### GET /line_items/:id

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

<pre>GET /line_items/11</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: b174f6d7-29aa-45da-802f-2fe7b398c4f2
X-Runtime: 0.010616
Content-Length: 137</pre>

#### Status

<pre>403 Forbidden</pre>

#### Body

<pre>{
  "errors": [
    {
      "title": "Show Forbidden",
      "detail": "You don't have permission to show this shopping/line item.",
      "code": "403",
      "status": "403"
    }
  ]
}</pre>

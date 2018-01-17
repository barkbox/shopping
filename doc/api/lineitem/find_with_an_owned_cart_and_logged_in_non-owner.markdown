# LineItem API

## Find with an owned cart and logged in non-owner

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

<pre>GET /line_items/27</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: 367616fe-86f7-44c9-8e9a-2f3b55ad0567
X-Runtime: 0.013357
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

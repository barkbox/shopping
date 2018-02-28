# LineItem API

## Update with owned cart and no logged in user

### PATCH /line_items/:id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| id | Line item id | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /line_items/6</pre>

#### Body

<pre>{"data":{"id":6,"type":"line_items","attributes":{"quantity":2}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: fa891fae-9aa7-4fd0-8b28-36ae4f5704b3
X-Runtime: 0.009901
Content-Length: 141</pre>

#### Status

<pre>403 Forbidden</pre>

#### Body

<pre>{
  "errors": [
    {
      "title": "Update Forbidden",
      "detail": "You don't have permission to update this shopping/line item.",
      "code": "403",
      "status": "403"
    }
  ]
}</pre>

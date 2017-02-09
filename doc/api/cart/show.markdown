# Cart API

## Show

### GET /api/v1/carts/:id

### Parameters

Name : cart_id
Description : Cart id

### Request

#### Headers

<pre>Host: example.org
Cookie: </pre>

#### Route

<pre>GET /api/v1/carts/1</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;4d8051e903e41cae6619c11c8d5c0de2&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 100a0bd7-fb55-4f06-b9ee-a9f6b596375a
X-Runtime: 0.018734
Content-Length: 176</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": {
    "id": "1",
    "type": "shopping_carts",
    "attributes": {
      "user_id": null,
      "purchased_at": null,
      "created_at": "2017-02-09T19:51:51.494Z"
    },
    "relationships": {
      "line_items": {
        "meta": {
        }
      }
    }
  }
}</pre>

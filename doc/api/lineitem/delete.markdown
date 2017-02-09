# LineItem API

## Delete

### DELETE /api/v1/line_items/:id

### Parameters

Name : line_item_id
Description : Line item id

### Request

#### Headers

<pre>Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /api/v1/line_items/1</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;13a5eaf9b021c2ac703c067dacef7e6a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 28eda93b-6d1b-44f7-aabe-92ac4d52ffaa
X-Runtime: 0.007248
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
      "created_at": "2017-02-09T19:51:51.445Z"
    },
    "relationships": {
      "line_items": {
        "data": [

        ]
      }
    }
  }
}</pre>

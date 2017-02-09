# LineItem API

## Update

### PUT /api/v1/line_items/:id

### Parameters

Name : line_item_id
Description : Line item id

### Request

#### Headers

<pre>Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>PUT /api/v1/line_items/1</pre>

#### Body

<pre>data[attributes][quantity]=2</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;1c326b9996c085178e5280b199aca20c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ebe85d85-6937-49b3-962a-364425ede66b
X-Runtime: 0.022600
Content-Length: 453</pre>

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
      "created_at": "2017-02-09T19:51:51.407Z"
    },
    "relationships": {
      "line_items": {
        "data": [
          {
            "id": "1",
            "type": "shopping_line_items"
          }
        ]
      }
    }
  },
  "included": [
    {
      "id": "1",
      "type": "shopping_line_items",
      "attributes": {
        "sale_price": "5.0",
        "list_price": "5.0",
        "quantity": 2,
        "created_at": "2017-02-09T19:51:51.411Z",
        "updated_at": "2017-02-09T19:51:51.422Z"
      },
      "relationships": {
        "source": {
          "meta": {
          }
        }
      }
    }
  ]
}</pre>

# Cart API

## Show incl line items

### GET /api/v1/carts/:id?include=line_items

### Parameters

Name : cart_id
Description : Cart id

### Request

#### Headers

<pre>Host: example.org
Cookie: </pre>

#### Route

<pre>GET /api/v1/carts/1?include=line_items</pre>

#### Query Parameters

<pre>include: line_items</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;b5cf6fa590f18b9daa68afa53e61b175&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: cf781322-4506-46e5-aa64-2fc8ed9c63b2
X-Runtime: 0.008348
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
      "created_at": "2017-02-09T19:51:51.569Z"
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
        "quantity": 1,
        "created_at": "2017-02-09T19:51:51.576Z",
        "updated_at": "2017-02-09T19:51:51.576Z"
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

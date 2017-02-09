# Cart API

## Show incl line items and sources

### GET /api/v1/carts/:id?include=line_items.source

### Parameters

Name : cart_id
Description : Cart id

### Request

#### Headers

<pre>Host: example.org
Cookie: </pre>

#### Route

<pre>GET /api/v1/carts/1?include=line_items.source</pre>

#### Query Parameters

<pre>include: line_items.source</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;70db4f5df360df2d236d13df149d4649&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7660efdd-8f57-4287-aa53-5974efefa3da
X-Runtime: 0.021511
Content-Length: 529</pre>

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
      "created_at": "2017-02-09T19:51:51.527Z"
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
        "created_at": "2017-02-09T19:51:51.531Z",
        "updated_at": "2017-02-09T19:51:51.531Z"
      },
      "relationships": {
        "source": {
          "data": {
            "id": "7",
            "type": "items"
          }
        }
      }
    },
    {
      "id": "7",
      "type": "items",
      "attributes": {
        "price": 5.0
      }
    }
  ]
}</pre>

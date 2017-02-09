# LineItem API

## Create

### POST /api/v1/line_items

### Parameters

Name : cart_id
Description : Cart id

Name : source_id *- required -*
Description : Source id

Name : source_type *- required -*
Description : Source type

### Request

#### Headers

<pre>Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /api/v1/line_items</pre>

#### Body

<pre>data[attributes][cart_id]=1&data[attributes][source_id]=1&data[attributes][source_type]=Item</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;05e9148dccec7c4d12446949e1687321&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 782dd9a8-b9fb-4832-be9d-e1044c957ad9
X-Runtime: 0.086507
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
      "created_at": "2017-02-09T19:51:51.241Z"
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
        "created_at": "2017-02-09T19:51:51.306Z",
        "updated_at": "2017-02-09T19:51:51.306Z"
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

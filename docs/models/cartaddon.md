# CartAddOn

A list of up to 3 add-ons that are displayed to the shopper.


## Fields

| Field                                                                    | Type                                                                     | Required                                                                 | Description                                                              |
| ------------------------------------------------------------------------ | ------------------------------------------------------------------------ | ------------------------------------------------------------------------ | ------------------------------------------------------------------------ |
| `description`                                                            | *Optional[str]*                                                          | :heavy_minus_sign:                                                       | The description of the product being displayed as an add on.             |
| `image_url`                                                              | *Optional[str]*                                                          | :heavy_minus_sign:                                                       | The URL of the image displayed for the add on product.                   |
| `name`                                                                   | *str*                                                                    | :heavy_check_mark:                                                       | The name of the product being displayed as an add on.                    |
| `price`                                                                  | *float*                                                                  | :heavy_check_mark:                                                       | The price of the product add on in cents (1/100).                        |
| `product_id`                                                             | *str*                                                                    | :heavy_check_mark:                                                       | The the ID of the product being displayed as an add on.                  |
| `product_page_url`                                                       | *Optional[str]*                                                          | :heavy_minus_sign:                                                       | The URL to the product page of the product being displayed as an add on. |
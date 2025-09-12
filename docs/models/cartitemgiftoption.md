# CartItemGiftOption

Contains the gift option settings for wrapping and custom messages.


## Fields

| Field                                             | Type                                              | Required                                          | Description                                       | Example                                           |
| ------------------------------------------------- | ------------------------------------------------- | ------------------------------------------------- | ------------------------------------------------- | ------------------------------------------------- |
| `cost`                                            | *Optional[int]*                                   | :heavy_minus_sign:                                | The cost in cents.                                | 770                                               |
| `merchant_product_id`                             | *Optional[str]*                                   | :heavy_minus_sign:                                | The merchant's unique ID for the product.         | 881                                               |
| `message`                                         | *Optional[str]*                                   | :heavy_minus_sign:                                | Includes the gift message written by the shopper. | Happy Anniversary, Smoochy Poo!                   |
| `wrap`                                            | *Optional[bool]*                                  | :heavy_minus_sign:                                | Defines whether gift wrapping was requested.      | false                                             |
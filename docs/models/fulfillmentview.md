# FulfillmentView


## Fields

| Field                                                                | Type                                                                 | Required                                                             | Description                                                          |
| -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `cart_shipment`                                                      | [Optional[models.ICartShipmentView]](../models/icartshipmentview.md) | :heavy_minus_sign:                                                   | N/A                                                                  |
| `fulfillment_type`                                                   | *Optional[str]*                                                      | :heavy_minus_sign:                                                   | N/A                                                                  |
| `id`                                                                 | *Optional[str]*                                                      | :heavy_minus_sign:                                                   | N/A                                                                  |
| `in_store_cart_shipment`                                             | [Optional[models.InStoreShipment2]](../models/instoreshipment2.md)   | :heavy_minus_sign:                                                   | A cart that is being prepared for shipment                           |
| `items`                                                              | List[[models.ICartItemView](../models/icartitemview.md)]             | :heavy_minus_sign:                                                   | N/A                                                                  |
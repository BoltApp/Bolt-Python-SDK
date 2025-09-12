# Fulfillment

Defines the shipments associated with the cart items.


## Fields

| Field                                                                    | Type                                                                     | Required                                                                 | Description                                                              |
| ------------------------------------------------------------------------ | ------------------------------------------------------------------------ | ------------------------------------------------------------------------ | ------------------------------------------------------------------------ |
| `cart_items`                                                             | List[[models.CartItem](../models/cartitem.md)]                           | :heavy_minus_sign:                                                       | N/A                                                                      |
| `cart_shipment`                                                          | [Optional[models.CartShipment]](../models/cartshipment.md)               | :heavy_minus_sign:                                                       | A cart that is being prepared for shipment                               |
| `digital_delivery`                                                       | [Optional[models.DigitalDelivery]](../models/digitaldelivery.md)         | :heavy_minus_sign:                                                       | N/A                                                                      |
| `in_store_cart_shipment`                                                 | [Optional[models.InStoreCartShipment]](../models/instorecartshipment.md) | :heavy_minus_sign:                                                       | N/A                                                                      |
| `type`                                                                   | [Optional[models.FulfillmentType]](../models/fulfillmenttype.md)         | :heavy_minus_sign:                                                       | N/A                                                                      |
# Orders
(*orders*)

## Overview

Use the Orders API to interact with the customer's cart throughout the checkout process. Pre-checkout, perform actions such as validating inventory, verifying discounts, and calculating taxes. Post-checkout, share shipping information so your customer can track their order. You'll interact with the [Merchant API](https://help.bolt.com/api-merchant/) to keep the servers in sync with any changes the customer makes to their cart. See our related guide [Create a Bolt Order Token](https://help.bolt.com/products/checkout/how-to-integrate/create-bolt-order-token-new/).


### Available Operations

* [create_order_token](#create_order_token) - Create Order Token
* [track_order](#track_order) - Send order tracking details

## create_order_token

Make a request to this endpoint to create a Bolt order, generate a Bolt order token, and initiate the checkout process. A Bolt order token is required for Bolt orders; see Non-Bolt orders for alternative use cases.

### Example Usage

<!-- UsageSnippet language="python" operationID="createOrderToken" method="post" path="/v1/merchant/orders" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.orders.create_order_token(request={
        "cart": {
            "billing_address": {
                "company": "Bolt",
                "country": "United States",
                "country_code": "US",
                "default": True,
                "door_code": "123456",
                "email": "alan.watts@example.com",
                "first_name": "Alan",
                "last_name": "Watts",
                "locality": "Brooklyn",
                "name": "Alan Watts",
                "phone": "+12125550199",
                "postal_code": "10044",
                "region": "NY",
                "region_code": "NY",
                "street_address1": "888 main street",
                "street_address2": "apt 3021",
                "street_address3": "c/o Alicia Watts",
                "street_address4": "Bridge Street Apartment Building B",
            },
            "discounts": [
                {
                    "amount": 100,
                    "code": "SUMMER10DISCOUNT",
                    "description": "10% off our summer collection",
                    "details_url": "https://boltswagstore.com/SUMMERSALE",
                    "reference": "DISC-1234",
                    "type": models.CartDiscountType.PERCENTAGE,
                },
            ],
            "fees": [
                {
                    "reference": "ItemFee",
                    "name": "Item Fee",
                    "description": "Item Fee",
                    "unit_price": 1497.81,
                    "unit_tax_amount": 8125.92,
                    "quantity": 9050.67,
                },
            ],
            "fulfillments": [
                models.Fulfillment(
                    cart_items=[
                        models.CartItem(
                            brand="Bolt",
                            category="bags",
                            collections=[
                                "summer",
                            ],
                            color="Bolt Blue",
                            customizations=[
                                models.CartItemCustomization(
                                    attributes={
                                        "key1": "value1",
                                        "key2": "value2",
                                    },
                                    price=754,
                                ),
                            ],
                            description="Large tote with Bolt logo.",
                            details_url="https://boltswagstore.com/products/123456",
                            gift_option=models.CartItemGiftOption(
                                cost=770,
                                merchant_product_id="881",
                                message="Happy Anniversary, Smoochy Poo!",
                                wrap=False,
                            ),
                            image_url="https://boltswagstore.com/products/123456/images/1.png",
                            isbn="9780091347314",
                            manufacturer="Bolt Textiles USA",
                            merchant_product_id="881",
                            merchant_variant_id="888",
                            name="Bolt Swag Bag",
                            options="Special Edition",
                            quantity=1,
                            reference="item_100",
                            shipment=models.CartShipment(
                                carrier="FedEx",
                                cost=770,
                                discounted_by_membership=False,
                                estimated_delivery_date="08-30-2022",
                                expedited=False,
                                package_depth=90,
                                package_dimension_unit="cm",
                                package_height=103,
                                package_type="A big package.",
                                package_weight_unit="kg",
                                package_width=222,
                                service="Option 1",
                                shipping_address=models.Address(
                                    company="Bolt",
                                    country="United States",
                                    country_code="US",
                                    default=True,
                                    door_code="123456",
                                    email="alan.watts@example.com",
                                    first_name="Alan",
                                    last_name="Watts",
                                    locality="Brooklyn",
                                    name="Alan Watts",
                                    phone="+12125550199",
                                    postal_code="10044",
                                    region="NY",
                                    region_code="NY",
                                    street_address1="888 main street",
                                    street_address2="apt 3021",
                                    street_address3="c/o Alicia Watts",
                                    street_address4="Bridge Street Apartment Building B",
                                ),
                                shipping_address_id="address1",
                                shipping_method="unknown",
                                signature="a1B2s3dC4f5g5D6hj6E7k8F9l0",
                                tax_amount=230,
                                tax_code="tax-12345",
                                total_weight=55,
                                total_weight_unit="kg",
                                type=models.CartShipmentType.DOOR_DELIVERY,
                            ),
                            size="Large",
                            sku="BOLT-SKU_100",
                            seller_id="seller-1234",
                            tags="tote, blue, linen, eco-friendly",
                            tax_amount=0,
                            total_amount=1000,
                            unit_price=1000,
                            uom="inches",
                            upc="0825764603119",
                            weight=10,
                            weight_unit="pounds",
                        ),
                    ],
                    cart_shipment=models.CartShipment(
                        carrier="FedEx",
                        cost=770,
                        discounted_by_membership=False,
                        estimated_delivery_date="08-30-2022",
                        expedited=False,
                        package_depth=90,
                        package_dimension_unit="cm",
                        package_height=103,
                        package_type="A big package.",
                        package_weight_unit="kg",
                        package_width=222,
                        service="Option 1",
                        shipping_address=models.Address(
                            company="Bolt",
                            country="United States",
                            country_code="US",
                            default=True,
                            door_code="123456",
                            email="alan.watts@example.com",
                            first_name="Alan",
                            last_name="Watts",
                            locality="Brooklyn",
                            name="Alan Watts",
                            phone="+12125550199",
                            postal_code="10044",
                            region="NY",
                            region_code="NY",
                            street_address1="888 main street",
                            street_address2="apt 3021",
                            street_address3="c/o Alicia Watts",
                            street_address4="Bridge Street Apartment Building B",
                        ),
                        shipping_address_id="address1",
                        shipping_method="unknown",
                        signature="a1B2s3dC4f5g5D6hj6E7k8F9l0",
                        tax_amount=230,
                        tax_code="tax-12345",
                        total_weight=55,
                        total_weight_unit="kg",
                        type=models.CartShipmentType.DOOR_DELIVERY,
                    ),
                    in_store_cart_shipment=models.InStoreCartShipment(
                        cart_shipment=models.CartShipment(
                            carrier="FedEx",
                            cost=770,
                            discounted_by_membership=False,
                            estimated_delivery_date="08-30-2022",
                            expedited=False,
                            package_depth=90,
                            package_dimension_unit="cm",
                            package_height=103,
                            package_type="A big package.",
                            package_weight_unit="kg",
                            package_width=222,
                            service="Option 1",
                            shipping_address=models.Address(
                                company="Bolt",
                                country="United States",
                                country_code="US",
                                default=True,
                                door_code="123456",
                                email="alan.watts@example.com",
                                first_name="Alan",
                                last_name="Watts",
                                locality="Brooklyn",
                                name="Alan Watts",
                                phone="+12125550199",
                                postal_code="10044",
                                region="NY",
                                region_code="NY",
                                street_address1="888 main street",
                                street_address2="apt 3021",
                                street_address3="c/o Alicia Watts",
                                street_address4="Bridge Street Apartment Building B",
                            ),
                            shipping_address_id="address1",
                            shipping_method="unknown",
                            signature="a1B2s3dC4f5g5D6hj6E7k8F9l0",
                            tax_amount=230,
                            tax_code="tax-12345",
                            total_weight=55,
                            total_weight_unit="kg",
                            type=models.CartShipmentType.DOOR_DELIVERY,
                        ),
                        description="Pick up in-store at 123 Main St.",
                        distance=3,
                        distance_unit=models.InStoreCartShipmentDistanceUnit.MILE,
                        in_store_pickup_address=models.Address(
                            company="Bolt",
                            country="United States",
                            country_code="US",
                            default=True,
                            door_code="123456",
                            email="alan.watts@example.com",
                            first_name="Alan",
                            last_name="Watts",
                            locality="Brooklyn",
                            name="Alan Watts",
                            phone="+12125550199",
                            postal_code="10044",
                            region="NY",
                            region_code="NY",
                            street_address1="888 main street",
                            street_address2="apt 3021",
                            street_address3="c/o Alicia Watts",
                            street_address4="Bridge Street Apartment Building B",
                        ),
                        store_name="Bolt Collective",
                    ),
                ),
            ],
            "in_store_cart_shipments": [
                models.InStoreCartShipment(
                    cart_shipment=models.CartShipment(
                        carrier="FedEx",
                        cost=770,
                        discounted_by_membership=False,
                        estimated_delivery_date="08-30-2022",
                        expedited=False,
                        package_depth=90,
                        package_dimension_unit="cm",
                        package_height=103,
                        package_type="A big package.",
                        package_weight_unit="kg",
                        package_width=222,
                        service="Option 1",
                        shipping_address=models.Address(
                            company="Bolt",
                            country="United States",
                            country_code="US",
                            default=True,
                            door_code="123456",
                            email="alan.watts@example.com",
                            first_name="Alan",
                            last_name="Watts",
                            locality="Brooklyn",
                            name="Alan Watts",
                            phone="+12125550199",
                            postal_code="10044",
                            region="NY",
                            region_code="NY",
                            street_address1="888 main street",
                            street_address2="apt 3021",
                            street_address3="c/o Alicia Watts",
                            street_address4="Bridge Street Apartment Building B",
                        ),
                        shipping_address_id="address1",
                        shipping_method="unknown",
                        signature="a1B2s3dC4f5g5D6hj6E7k8F9l0",
                        tax_amount=230,
                        tax_code="tax-12345",
                        total_weight=55,
                        total_weight_unit="kg",
                        type=models.CartShipmentType.DOOR_DELIVERY,
                    ),
                    description="Pick up in-store at 123 Main St.",
                    distance=3,
                    distance_unit=models.InStoreCartShipmentDistanceUnit.MILE,
                    in_store_pickup_address=models.Address(
                        company="Bolt",
                        country="United States",
                        country_code="US",
                        default=True,
                        door_code="123456",
                        email="alan.watts@example.com",
                        first_name="Alan",
                        last_name="Watts",
                        locality="Brooklyn",
                        name="Alan Watts",
                        phone="+12125550199",
                        postal_code="10044",
                        region="NY",
                        region_code="NY",
                        street_address1="888 main street",
                        street_address2="apt 3021",
                        street_address3="c/o Alicia Watts",
                        street_address4="Bridge Street Apartment Building B",
                    ),
                    store_name="Bolt Collective",
                ),
            ],
            "items": [
                {
                    "brand": "Bolt",
                    "category": "bags",
                    "collections": [
                        "summer",
                    ],
                    "color": "Bolt Blue",
                    "customizations": [
                        {
                            "attributes": {
                                "key1": "value1",
                                "key2": "value2",
                            },
                            "price": 754,
                        },
                    ],
                    "description": "Large tote with Bolt logo.",
                    "details_url": "https://boltswagstore.com/products/123456",
                    "gift_option": {
                        "cost": 770,
                        "merchant_product_id": "881",
                        "message": "Happy Anniversary, Smoochy Poo!",
                        "wrap": False,
                    },
                    "image_url": "https://boltswagstore.com/products/123456/images/1.png",
                    "isbn": "9780091347314",
                    "manufacturer": "Bolt Textiles USA",
                    "merchant_product_id": "881",
                    "merchant_variant_id": "888",
                    "name": "Bolt Swag Bag",
                    "options": "Special Edition",
                    "quantity": 1,
                    "reference": "item_100",
                    "shipment": {
                        "carrier": "FedEx",
                        "cost": 770,
                        "discounted_by_membership": False,
                        "estimated_delivery_date": "08-30-2022",
                        "expedited": False,
                        "package_depth": 90,
                        "package_dimension_unit": "cm",
                        "package_height": 103,
                        "package_type": "A big package.",
                        "package_weight_unit": "kg",
                        "package_width": 222,
                        "service": "Option 1",
                        "shipping_address": {
                            "company": "Bolt",
                            "country": "United States",
                            "country_code": "US",
                            "default": True,
                            "door_code": "123456",
                            "email": "alan.watts@example.com",
                            "first_name": "Alan",
                            "last_name": "Watts",
                            "locality": "Brooklyn",
                            "name": "Alan Watts",
                            "phone": "+12125550199",
                            "postal_code": "10044",
                            "region": "NY",
                            "region_code": "NY",
                            "street_address1": "888 main street",
                            "street_address2": "apt 3021",
                            "street_address3": "c/o Alicia Watts",
                            "street_address4": "Bridge Street Apartment Building B",
                        },
                        "shipping_address_id": "address1",
                        "shipping_method": "unknown",
                        "signature": "a1B2s3dC4f5g5D6hj6E7k8F9l0",
                        "tax_amount": 230,
                        "tax_code": "tax-12345",
                        "total_weight": 55,
                        "total_weight_unit": "kg",
                        "type": models.CartShipmentType.DOOR_DELIVERY,
                    },
                    "size": "Large",
                    "sku": "BOLT-SKU_100",
                    "seller_id": "seller-1234",
                    "tags": "tote, blue, linen, eco-friendly",
                    "tax_amount": 0,
                    "total_amount": 1000,
                    "unit_price": 1000,
                    "uom": "inches",
                    "upc": "0825764603119",
                    "weight": 10,
                    "weight_unit": "pounds",
                },
            ],
            "loyalty_rewards": [
                {
                    "description": "$5 off (100 Points)",
                    "details": "{\"id\": 123456, \"icon\": \"fa-dollar\", \"name\": \"$15.00 Off\", \"type\": \"Coupon\", \"amount\": 100, \"duration\": \"single_use\", \"cost_text\": \"150 Points\",  \"description\": \"Get $15 off your next purchase for 150 points\", \"discount_type\": \"fixed_amount\", \"unrendered_name\": \"$15.00 Off\",  \"discount_percentage\": null, \"discount_rate_cents\": null, \"discount_value_cents\": null, \"discount_amount_cents\": 1500,  \"unrendered_description\": \"Get $15 off your next purchase for 150 points\", \"applies_to_product_type\": \"ALL\"}",
                },
            ],
            "shipments": [
                {
                    "carrier": "FedEx",
                    "cost": 770,
                    "discounted_by_membership": False,
                    "estimated_delivery_date": "08-30-2022",
                    "expedited": False,
                    "package_depth": 90,
                    "package_dimension_unit": "cm",
                    "package_height": 103,
                    "package_type": "A big package.",
                    "package_weight_unit": "kg",
                    "package_width": 222,
                    "service": "Option 1",
                    "shipping_address": {
                        "company": "Bolt",
                        "country": "United States",
                        "country_code": "US",
                        "default": True,
                        "door_code": "123456",
                        "email": "alan.watts@example.com",
                        "first_name": "Alan",
                        "last_name": "Watts",
                        "locality": "Brooklyn",
                        "name": "Alan Watts",
                        "phone": "+12125550199",
                        "postal_code": "10044",
                        "region": "NY",
                        "region_code": "NY",
                        "street_address1": "888 main street",
                        "street_address2": "apt 3021",
                        "street_address3": "c/o Alicia Watts",
                        "street_address4": "Bridge Street Apartment Building B",
                    },
                    "shipping_address_id": "address1",
                    "shipping_method": "unknown",
                    "signature": "a1B2s3dC4f5g5D6hj6E7k8F9l0",
                    "tax_amount": 230,
                    "tax_code": "tax-12345",
                    "total_weight": 55,
                    "total_weight_unit": "kg",
                    "type": models.CartShipmentType.DOOR_DELIVERY,
                },
            ],
            "total_amount": 900,
            "cart_url": "https://boltswagstore.com/orders/123456765432",
            "currency": "USD",
            "display_id": "displayid_100",
            "metadata": {
                "key1": "value1",
                "key2": "value2",
            },
            "order_description": "Order #1234567890",
            "order_reference": "order_100",
        },
        "channel": models.Channel.BROWSER,
        "create_cart_on_merchant_backend": False,
        "metadata": {
            "encrypted_user_id": "ID12345678",
        },
        "user_note": "Happy Birthday to my best friend in the whole world. Enjoy!",
        "seller_splits": [
            {
                "seller_id": "seller-1234",
                "amounts": {
                    "merchant_subtotal": 5000,
                    "discount_total": 500,
                    "shipping_total": 1000,
                    "tax_total": 400,
                    "gross_total": 5900,
                },
                "marketplace_commission_fee": {
                    "bps": 250,
                    "flat_cents": 100,
                    "metadata": {
                        "plan_type": "pro",
                        "tier": "premium",
                    },
                },
            },
        ],
    })

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `request`                                                           | [models.OrderCreate](../../models/ordercreate.md)                   | :heavy_check_mark:                                                  | The request object to use for the request.                          |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.IOrderView](../../models/iorderview.md)**

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| errors.ErrorsBoltAPIResponse | 400, 403, 422                | application/json             |
| errors.APIError              | 4XX, 5XX                     | \*/\*                        |

## track_order

Send the carrier and order tracking number to Bolt (after a label has been printed). Bolt then uses EasyPost to forward ongoing tracking event updates to the shopper. This request must include **all** items included in the shipment; their references must also match those found in the original cart generation.


### Example Usage

<!-- UsageSnippet language="python" operationID="trackOrder" method="post" path="/v1/merchant/track_shipment" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.orders.track_order(request={
        "carrier": "UPS",
        "is_non_bolt_order": False,
        "items": [],
        "tracking_number": "EZ1000000001",
        "transaction_reference": "LBLJ-TWW7-R9VC",
    })

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                             | Type                                                                  | Required                                                              | Description                                                           |
| --------------------------------------------------------------------- | --------------------------------------------------------------------- | --------------------------------------------------------------------- | --------------------------------------------------------------------- |
| `request`                                                             | [models.OrderTrackRequestBody](../../models/ordertrackrequestbody.md) | :heavy_check_mark:                                                    | The request object to use for the request.                            |
| `retries`                                                             | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)      | :heavy_minus_sign:                                                    | Configuration to override the default retry behavior of the client.   |

### Response

**[models.OrderTrackResponse](../../models/ordertrackresponse.md)**

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| errors.ErrorsBoltAPIResponse | 400, 422                     | application/json             |
| errors.APIError              | 4XX, 5XX                     | \*/\*                        |
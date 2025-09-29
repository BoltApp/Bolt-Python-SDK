# Transactions
(*transactions*)

## Overview

Use the Transactions endpoint to authorize payments when the shopper checks out and handle post authorization actions such as captures and refunds. You can use a shopper's existing saved payment information or tokenize new payment information with the [Bolt Tokenizer](https://help.bolt.com/api-tokenizer/). Bolt Authorize Transaction types fall into one of three categories: a logged-in shopper checking out with a saved payment method, any type of shopper checking out with a new payment method, and a logged-in shopper checking out with a new payment method. The new payment method will be saved to the shopper's account.


### Available Operations

* [authorize_transaction](#authorize_transaction) - Authorize a Card
* [capture_transaction](#capture_transaction) - Capture a Transaction
* [refund_transaction](#refund_transaction) - Refund a Transaction
* [review_transaction](#review_transaction) - Review Transaction
* [void_transaction](#void_transaction) - Void a Transaction
* [get_transaction_details](#get_transaction_details) - Transaction Details
* [update_transaction](#update_transaction) - Update a Transaction

## authorize_transaction

This endpoint authorizes card payments and has three main use cases:
* • Authorize a payment using an unsaved payment method for a guest or logged-in shopper.
* • Authorize a payment using a saved payment method for a logged-in shopper.
*  • Re-charge a previous transaction using the `credit_card_id` of the transaction.


### Example Usage

<!-- UsageSnippet language="python" operationID="authorizeTransaction" method="post" path="/v1/merchant/transactions/authorize" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt() as bolt:

    res = bolt.transactions.authorize_transaction(security=models.AuthorizeTransactionSecurity(
        o_auth=os.getenv("BOLT_O_AUTH", ""),
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ), request_body=models.MerchantCreditCardAuthorization(
        cart=models.CartCreate(
            billing_address=models.Address(
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
            discounts=[
                models.CartDiscount(
                    amount=100,
                    code="SUMMER10DISCOUNT",
                    description="10% off our summer collection",
                    details_url="https://boltswagstore.com/SUMMERSALE",
                    reference="DISC-1234",
                    type=models.CartDiscountType.PERCENTAGE,
                ),
            ],
            fees=[
                models.CartFee(
                    reference="ItemFee",
                    name="Item Fee",
                    description="Item Fee",
                    unit_price=1283.86,
                    unit_tax_amount=8693.22,
                    quantity=1310.83,
                ),
            ],
            fulfillments=[
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
            in_store_cart_shipments=[
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
            items=[
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
            loyalty_rewards=[
                models.CartLoyaltyRewards(
                    description="$5 off (100 Points)",
                    details="{\"id\": 123456, \"icon\": \"fa-dollar\", \"name\": \"$15.00 Off\", \"type\": \"Coupon\", \"amount\": 100, \"duration\": \"single_use\", \"cost_text\": \"150 Points\",  \"description\": \"Get $15 off your next purchase for 150 points\", \"discount_type\": \"fixed_amount\", \"unrendered_name\": \"$15.00 Off\",  \"discount_percentage\": null, \"discount_rate_cents\": null, \"discount_value_cents\": null, \"discount_amount_cents\": 1500,  \"unrendered_description\": \"Get $15 off your next purchase for 150 points\", \"applies_to_product_type\": \"ALL\"}",
                ),
            ],
            shipments=[
                models.CartShipment(
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
            ],
            total_amount=900,
            cart_url="https://boltswagstore.com/orders/123456765432",
            currency="USD",
            display_id="displayid_100",
            metadata={
                "key1": "value1",
                "key2": "value2",
            },
            order_description="Order #1234567890",
            order_reference="order_100",
        ),
        create_bolt_account=True,
        credit_card=models.CreditCard(
            billing_address=models.Address(
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
            bin="411111",
            expiration="2025-11",
            last4="1234",
            postal_code="10044",
            token="a1B2c3D4e5F6G7H8i9J0k1L2m3N4o5P6Q7r8S9t0",
            token_type=models.CreditCardTokenType.BOLT,
        ),
        division_id="3X9aPQ67-YrB",
        merchant_event_id="dbe0cd5d-3261-41d9-ba61-49e5b9d07567",
        previous_transaction_id=None,
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
        source=models.MerchantCreditCardAuthorizationSource.DIRECT_PAYMENTS,
        user_identifier=models.UserIdentifier(
            artifact="<value>",
            email="alan.watts@example.com",
            email_id="<id>",
            phone="+12125550199",
            phone_id="<id>",
        ),
        user_identity=models.UserIdentity(
            first_name="Charlotte",
            last_name="Charles",
        ),
    ))

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                                                                                                                                                                                                                                                                                                        | Type                                                                                                                                                                                                                                                                                                                                                                                                                             | Required                                                                                                                                                                                                                                                                                                                                                                                                                         | Description                                                                                                                                                                                                                                                                                                                                                                                                                      |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `security`                                                                                                                                                                                                                                                                                                                                                                                                                       | [models.AuthorizeTransactionSecurity](../../models/authorizetransactionsecurity.md)                                                                                                                                                                                                                                                                                                                                              | :heavy_check_mark:                                                                                                                                                                                                                                                                                                                                                                                                               | N/A                                                                                                                                                                                                                                                                                                                                                                                                                              |
| `x_publishable_key`                                                                                                                                                                                                                                                                                                                                                                                                              | *Optional[str]*                                                                                                                                                                                                                                                                                                                                                                                                                  | :heavy_minus_sign:                                                                                                                                                                                                                                                                                                                                                                                                               | The publicly viewable identifier used to identify a merchant division. This key is found in the Developer > API section of the Bolt Merchant Dashboard [RECOMMENDED].                                                                                                                                                                                                                                                            |
| `idempotency_key`                                                                                                                                                                                                                                                                                                                                                                                                                | *Optional[str]*                                                                                                                                                                                                                                                                                                                                                                                                                  | :heavy_minus_sign:                                                                                                                                                                                                                                                                                                                                                                                                               | A key created by merchants that ensures `POST` and `PATCH` requests are only performed once. [Read more about Idempotent Requests here](/developers/references/idempotency/).                                                                                                                                                                                                                                                    |
| `request_body`                                                                                                                                                                                                                                                                                                                                                                                                                   | [Optional[models.AuthorizeTransactionRequestBody]](../../models/authorizetransactionrequestbody.md)                                                                                                                                                                                                                                                                                                                              | :heavy_minus_sign:                                                                                                                                                                                                                                                                                                                                                                                                               | **Authorize a Transaction**<br/>* • `merchant_credit_card_authorization`: For authorizing with a new, unsaved card. This can be for a guest checkout flow, one-time payment, or an existing Bolt shopper.<br/>* • `merchant_credit_card_authorization_recharge`: For authorizing a card using a shoppers saved payment methods.<br/>* • **Anytime the shopper is paying while logged-in attach their OAuth `access_token` to the request.**<br/> |
| `retries`                                                                                                                                                                                                                                                                                                                                                                                                                        | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                                                                                                                                                                                                                                                                                 | :heavy_minus_sign:                                                                                                                                                                                                                                                                                                                                                                                                               | Configuration to override the default retry behavior of the client.                                                                                                                                                                                                                                                                                                                                                              |

### Response

**[models.IAuthorizeResultView](../../models/iauthorizeresultview.md)**

### Errors

| Error Type      | Status Code     | Content Type    |
| --------------- | --------------- | --------------- |
| errors.APIError | 4XX, 5XX        | \*/\*           |

## capture_transaction

This captures funds for the designated transaction. A capture can be done for any partial amount or for the total authorized amount.

Although the response returns the standard `transaction_view` object, only `captures` and either `id` or `reference` are needed.


### Example Usage

<!-- UsageSnippet language="python" operationID="captureTransaction" method="post" path="/v1/merchant/transactions/capture" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.transactions.capture_transaction(capture_transaction_with_reference={
        "amount": 754,
        "currency": "USD",
        "merchant_event_id": "dbe0cd5d-3261-41d9-ba61-49e5b9d07567",
        "skip_hook_notification": False,
        "transaction_reference": "LBLJ-TWW7-R9VC",
    })

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                                                     | Type                                                                                                                                                                          | Required                                                                                                                                                                      | Description                                                                                                                                                                   |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `idempotency_key`                                                                                                                                                             | *Optional[str]*                                                                                                                                                               | :heavy_minus_sign:                                                                                                                                                            | A key created by merchants that ensures `POST` and `PATCH` requests are only performed once. [Read more about Idempotent Requests here](/developers/references/idempotency/). |
| `capture_transaction_with_reference`                                                                                                                                          | [Optional[models.CaptureTransactionWithReference]](../../models/capturetransactionwithreference.md)                                                                           | :heavy_minus_sign:                                                                                                                                                            | Capture a Transaction                                                                                                                                                         |
| `retries`                                                                                                                                                                     | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                              | :heavy_minus_sign:                                                                                                                                                            | Configuration to override the default retry behavior of the client.                                                                                                           |

### Response

**[models.TransactionView](../../models/transactionview.md)**

### Errors

| Error Type                      | Status Code                     | Content Type                    |
| ------------------------------- | ------------------------------- | ------------------------------- |
| errors.ErrorsBoltAPIResponse    | 403, 404                        | application/json                |
| errors.UnprocessableEntityError | 422                             | application/json                |
| errors.APIError                 | 4XX, 5XX                        | \*/\*                           |

## refund_transaction

This refunds a captured transaction. Refunds can be done for any partial amount or for the total authorized amount. These refunds are processed synchronously and return information about the refunded transaction in the standard `transaction_view` object.

### Example Usage

<!-- UsageSnippet language="python" operationID="refundTransaction" method="post" path="/v1/merchant/transactions/credit" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.transactions.refund_transaction(transaction_credit={
        "amount": 754,
        "currency": "USD",
        "merchant_event_id": "dbe0cd5d-3261-41d9-ba61-49e5b9d07567",
        "skip_hook_notification": False,
        "transaction_reference": "LBLJ-TWW7-R9VC",
    })

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                                                     | Type                                                                                                                                                                          | Required                                                                                                                                                                      | Description                                                                                                                                                                   |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `idempotency_key`                                                                                                                                                             | *Optional[str]*                                                                                                                                                               | :heavy_minus_sign:                                                                                                                                                            | A key created by merchants that ensures `POST` and `PATCH` requests are only performed once. [Read more about Idempotent Requests here](/developers/references/idempotency/). |
| `transaction_credit`                                                                                                                                                          | [Optional[models.TransactionCredit]](../../models/transactioncredit.md)                                                                                                       | :heavy_minus_sign:                                                                                                                                                            | Refund a Transaction                                                                                                                                                          |
| `retries`                                                                                                                                                                     | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                              | :heavy_minus_sign:                                                                                                                                                            | Configuration to override the default retry behavior of the client.                                                                                                           |

### Response

**[models.TransactionView](../../models/transactionview.md)**

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| errors.ErrorsBoltAPIResponse | 422                          | application/json             |
| errors.APIError              | 4XX, 5XX                     | \*/\*                        |

## review_transaction

This endpoint is used to manually approve or reject orders for a specified transaction.

### Example Usage

<!-- UsageSnippet language="python" operationID="reviewTransaction" method="post" path="/v1/merchant/transactions/review" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.transactions.review_transaction(merchant_credit_card_review={
        "decision": models.Decision.APPROVE,
        "transaction_reference": "LBLJ-TWW7-R9VC",
    })

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                                                     | Type                                                                                                                                                                          | Required                                                                                                                                                                      | Description                                                                                                                                                                   |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `idempotency_key`                                                                                                                                                             | *Optional[str]*                                                                                                                                                               | :heavy_minus_sign:                                                                                                                                                            | A key created by merchants that ensures `POST` and `PATCH` requests are only performed once. [Read more about Idempotent Requests here](/developers/references/idempotency/). |
| `merchant_credit_card_review`                                                                                                                                                 | [Optional[models.MerchantCreditCardReview]](../../models/merchantcreditcardreview.md)                                                                                         | :heavy_minus_sign:                                                                                                                                                            | Review a Transaction                                                                                                                                                          |
| `retries`                                                                                                                                                                     | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                              | :heavy_minus_sign:                                                                                                                                                            | Configuration to override the default retry behavior of the client.                                                                                                           |

### Response

**[models.TransactionDetailsView](../../models/transactiondetailsview.md)**

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| errors.ErrorsBoltAPIResponse | 403, 404, 422                | application/json             |
| errors.APIError              | 4XX, 5XX                     | \*/\*                        |

## void_transaction

This voids the authorization for a given transaction. Voids must be completed before the authorization is captured.
In the request, either `transaction_id` or `transaction_reference` is required.
Although the response returns the standard `transaction_view` object, only `status` and either `id` or `reference` are needed.


### Example Usage

<!-- UsageSnippet language="python" operationID="voidTransaction" method="post" path="/v1/merchant/transactions/void" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.transactions.void_transaction(credit_card_void={
        "merchant_event_id": "dbe0cd5d-3261-41d9-ba61-49e5b9d07567",
        "skip_hook_notification": False,
        "transaction_reference": "LBLJ-TWW7-R9VC",
    })

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                                                     | Type                                                                                                                                                                          | Required                                                                                                                                                                      | Description                                                                                                                                                                   |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `idempotency_key`                                                                                                                                                             | *Optional[str]*                                                                                                                                                               | :heavy_minus_sign:                                                                                                                                                            | A key created by merchants that ensures `POST` and `PATCH` requests are only performed once. [Read more about Idempotent Requests here](/developers/references/idempotency/). |
| `credit_card_void`                                                                                                                                                            | [Optional[models.CreditCardVoid]](../../models/creditcardvoid.md)                                                                                                             | :heavy_minus_sign:                                                                                                                                                            | Void a Transaction                                                                                                                                                            |
| `retries`                                                                                                                                                                     | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                              | :heavy_minus_sign:                                                                                                                                                            | Configuration to override the default retry behavior of the client.                                                                                                           |

### Response

**[models.TransactionView](../../models/transactionview.md)**

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| errors.ErrorsBoltAPIResponse | 403, 404                     | application/json             |
| errors.APIError              | 4XX, 5XX                     | \*/\*                        |

## get_transaction_details

This allows you to pull the full transaction details for a given transaction.

 **Note**: All objects and fields marked `required` in the Transaction Details response are also **nullable**. This includes any sub-components (objects or fields) also marked `required`.


### Example Usage

<!-- UsageSnippet language="python" operationID="getTransactionDetails" method="get" path="/v1/merchant/transactions/{REFERENCE}" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.transactions.get_transaction_details(reference="<value>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `reference`                                                         | *str*                                                               | :heavy_check_mark:                                                  | This is the Bolt transaction reference. (ex. N7Y3-NFKC-VFRF)        |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.TransactionDetails](../../models/transactiondetails.md)**

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| errors.ErrorsBoltAPIResponse | 403, 422                     | application/json             |
| errors.APIError              | 4XX, 5XX                     | \*/\*                        |

## update_transaction

This allows you to update certain transaction properties post-authorization.

### Example Usage

<!-- UsageSnippet language="python" operationID="updateTransaction" method="patch" path="/v1/merchant/transactions/{REFERENCE}" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.transactions.update_transaction(reference="<value>", display_id="order-123", metadata={
        "key1": "value1",
        "key2": "value2",
    })

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                                                     | Type                                                                                                                                                                          | Required                                                                                                                                                                      | Description                                                                                                                                                                   | Example                                                                                                                                                                       |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `reference`                                                                                                                                                                   | *str*                                                                                                                                                                         | :heavy_check_mark:                                                                                                                                                            | This is the Bolt transaction reference. (ex. N7Y3-NFKC-VFRF)                                                                                                                  |                                                                                                                                                                               |
| `idempotency_key`                                                                                                                                                             | *Optional[str]*                                                                                                                                                               | :heavy_minus_sign:                                                                                                                                                            | A key created by merchants that ensures `POST` and `PATCH` requests are only performed once. [Read more about Idempotent Requests here](/developers/references/idempotency/). |                                                                                                                                                                               |
| `display_id`                                                                                                                                                                  | *Optional[str]*                                                                                                                                                               | :heavy_minus_sign:                                                                                                                                                            | This field corresponds to the merchant's order reference associated with this Bolt transaction.                                                                               | order-123                                                                                                                                                                     |
| `metadata`                                                                                                                                                                    | Dict[str, *str*]                                                                                                                                                              | :heavy_minus_sign:                                                                                                                                                            | Custom metadata associated with this Bolt transaction.                                                                                                                        | {<br/>"key1": "value1",<br/>"key2": "value2"<br/>}                                                                                                                            |
| `retries`                                                                                                                                                                     | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                              | :heavy_minus_sign:                                                                                                                                                            | Configuration to override the default retry behavior of the client.                                                                                                           |                                                                                                                                                                               |

### Response

**[models.TransactionDetails](../../models/transactiondetails.md)**

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| errors.ErrorsBoltAPIResponse | 403, 404                     | application/json             |
| errors.APIError              | 4XX, 5XX                     | \*/\*                        |
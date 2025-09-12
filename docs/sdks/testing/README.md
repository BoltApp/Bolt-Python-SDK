# Testing
(*testing*)

## Overview

The testing endpoint allows you to test various functionality within Bolt. Create a test credit card to process a test payment in your store. You can also simulate tracking an order’s shipment and programmatically create customer accounts to use as dummy data. See our related guide on [Testing](https://help.bolt.com/developers/production-readiness-guides/test-cards/).


### Available Operations

* [test_shipping](#test_shipping) - Test Shipping
* [create_testing_shopper_account](#create_testing_shopper_account) - Create Testing Shopper Account
* [get_test_credit_card_token](#get_test_credit_card_token) - Fetch a Test Credit Card Token

## test_shipping

This endpoint simulates tracking an order's shipment and is for testing purposes only.

### Example Usage

<!-- UsageSnippet language="python" operationID="testShipping" method="post" path="/v1/shipments/mock_bolt_shipping" -->
```python
from bolt_api_sdk import Bolt, models
from bolt_api_sdk.utils import parse_datetime
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    bolt.testing.test_shipping(request={
        "delivery_estimate": "<value>",
        "status": models.MockTrackingInputStatus.FAILURE,
        "tracking_detail": [
            {
                "city": "New York",
                "country": "USA",
                "datetime": parse_datetime("2017-07-21T17:32:28Z"),
                "message": "BILLING INFORMATION RECEIVED",
                "state": "New York",
                "status": models.TrackingDetailStatus.IN_TRANSIT,
                "zip": "10044",
            },
        ],
        "tracking_number": "MockBolt1234",
    })

    # Use the SDK ...

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `request`                                                           | [models.MockTrackingInput](../../models/mocktrackinginput.md)       | :heavy_check_mark:                                                  | The request object to use for the request.                          |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| errors.ErrorsBoltAPIResponse | 400, 422                     | application/json             |
| errors.APIError              | 4XX, 5XX                     | \*/\*                        |

## create_testing_shopper_account

Create a Bolt shopper account for testing purposes. Available for sandbox use only and the created  account will be recycled after a certain time.

### Example Usage

<!-- UsageSnippet language="python" operationID="createTestingShopperAccount" method="post" path="/v1/testing/shopper/create" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.testing.create_testing_shopper_account(testing_account_request=models.TestingAccountRequest(
        deactivate_in_days=30,
        email_state=models.AccountIdentifierStatus.VERIFIED,
        phone_state=models.AccountIdentifierStatus.VERIFIED,
    ))

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                                             | Type                                                                                                                                                                  | Required                                                                                                                                                              | Description                                                                                                                                                           | Example                                                                                                                                                               |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `x_publishable_key`                                                                                                                                                   | *Optional[str]*                                                                                                                                                       | :heavy_minus_sign:                                                                                                                                                    | The publicly viewable identifier used to identify a merchant division. This key is found in the Developer > API section of the Bolt Merchant Dashboard [RECOMMENDED]. |                                                                                                                                                                       |
| `testing_account_request`                                                                                                                                             | [Optional[models.TestingAccountRequest]](../../models/testingaccountrequest.md)                                                                                       | :heavy_minus_sign:                                                                                                                                                    | N/A                                                                                                                                                                   | {<br/>"deactivate_in_days": 30,<br/>"email_state": "verified",<br/>"phone_state": "verified"<br/>}                                                                    |
| `retries`                                                                                                                                                             | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                      | :heavy_minus_sign:                                                                                                                                                    | Configuration to override the default retry behavior of the client.                                                                                                   |                                                                                                                                                                       |

### Response

**[models.TestingAccountDetails](../../models/testingaccountdetails.md)**

### Errors

| Error Type      | Status Code     | Content Type    |
| --------------- | --------------- | --------------- |
| errors.APIError | 4XX, 5XX        | \*/\*           |

## get_test_credit_card_token

This endpoint fetches a new credit card token for Bolt's universal test credit card number `4111 1111 1111 1004`. This is for testing and is available only in sandbox.

### Example Usage

<!-- UsageSnippet language="python" operationID="getTestCreditCardToken" method="get" path="/v1/testing/card_token" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.testing.get_test_credit_card_token()

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.GetTestCreditCardTokenResponse](../../models/gettestcreditcardtokenresponse.md)**

### Errors

| Error Type      | Status Code     | Content Type    |
| --------------- | --------------- | --------------- |
| errors.APIError | 4XX, 5XX        | \*/\*           |
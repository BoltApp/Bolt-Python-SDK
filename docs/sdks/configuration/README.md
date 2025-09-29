# Configuration
(*configuration*)

## Overview

Use this resource to retrieve and set Merchant Callback URLs. Bolt uses these URLs to exchange information with your commerce server. See our related guide [About the Merchant Callback API](https://help.bolt.com/products/checkout/how-to-integrate/merchant-api-new/).   


### Available Operations

* [get_merchant_callbacks](#get_merchant_callbacks) - Get Callback URLs
* [set_merchant_callbacks](#set_merchant_callbacks) - Set Callback URLs
* [get_merchant_identifiers](#get_merchant_identifiers) - Get Merchant Identifiers

## get_merchant_callbacks

Retrieves callbacks URLs for a Bolt merchant division.

### Example Usage

<!-- UsageSnippet language="python" operationID="getMerchantCallbacks" method="get" path="/v1/merchant/callbacks" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.configuration.get_merchant_callbacks(division_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                                                                                                                                                 | Type                                                                                                                                                                                                                                                                      | Required                                                                                                                                                                                                                                                                  | Description                                                                                                                                                                                                                                                               |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `division_id`                                                                                                                                                                                                                                                             | *str*                                                                                                                                                                                                                                                                     | :heavy_check_mark:                                                                                                                                                                                                                                                        | The unique ID associated to the merchant's Bolt Account division; Merchants can have different divisions to suit multiple use cases (storefronts, pay-by-link, phone order processing). You can view and switch between these divisions from the Bolt Merchant Dashboard. |
| `retries`                                                                                                                                                                                                                                                                 | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                                                                                                                          | :heavy_minus_sign:                                                                                                                                                                                                                                                        | Configuration to override the default retry behavior of the client.                                                                                                                                                                                                       |

### Response

**[models.MerchantCallbacksView](../../models/merchantcallbacksview.md)**

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| errors.ErrorsBoltAPIResponse | 400, 403                     | application/json             |
| errors.APIError              | 4XX, 5XX                     | \*/\*                        |

## set_merchant_callbacks

Configure callbacks URLs for a Bolt merchant division. This will store or override only the callback URLs that are specified in the request. Operations are fully transactional.

### Example Usage

<!-- UsageSnippet language="python" operationID="setMerchantCallbacks" method="post" path="/v1/merchant/callbacks" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    bolt.configuration.set_merchant_callbacks(request={
        "callback_urls": [
            {
                "type": models.MerchantCallbackURLType.OAUTH_REDIRECT,
                "url": "https://example.com/1",
            },
            {
                "type": models.MerchantCallbackURLType.OAUTH_LOGOUT,
                "url": "https://example.com/2",
            },
            {
                "type": models.MerchantCallbackURLType.GET_ACCOUNT,
                "url": "https://example.com/3",
            },
        ],
        "division_id": "3X9aPQ67-YrB",
    })

    # Use the SDK ...

```

### Parameters

| Parameter                                                               | Type                                                                    | Required                                                                | Description                                                             |
| ----------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| `request`                                                               | [models.MerchantCallbacksInput](../../models/merchantcallbacksinput.md) | :heavy_check_mark:                                                      | The request object to use for the request.                              |
| `retries`                                                               | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)        | :heavy_minus_sign:                                                      | Configuration to override the default retry behavior of the client.     |

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| errors.ErrorsBoltAPIResponse | 400, 403, 422                | application/json             |
| errors.APIError              | 4XX, 5XX                     | \*/\*                        |

## get_merchant_identifiers

This endpoint returns the merchant's public ID and the [publishable key](https://help.bolt.com/developers/tools/api-keys/) related to the merchant division.

### Example Usage

<!-- UsageSnippet language="python" operationID="getMerchantIdentifiers" method="get" path="/v1/merchant/identifiers" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.configuration.get_merchant_identifiers()

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.MerchantIdentifiersView](../../models/merchantidentifiersview.md)**

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| errors.ErrorsBoltAPIResponse | 403                          | application/json             |
| errors.APIError              | 4XX, 5XX                     | \*/\*                        |
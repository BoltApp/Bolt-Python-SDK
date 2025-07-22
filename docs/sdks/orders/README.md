# Orders
(*orders*)

## Overview

### Available Operations

* [list](#list) - Get all subscription orders

## list

Retrieves a list of all subscription orders.

### Example Usage

```python
from bolt import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as b_client:

    res = b_client.orders.list()

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `subscription_ids`                                                  | *Optional[str]*                                                     | :heavy_minus_sign:                                                  | Comma-separated list of subscription IDs to filter orders.          |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[List[models.SubscriptionOrder]](../../models/.md)**

### Errors

| Error Type      | Status Code     | Content Type    |
| --------------- | --------------- | --------------- |
| errors.APIError | 4XX, 5XX        | \*/\*           |
# Subscriptions
(*subscriptions*)

## Overview

### Available Operations

* [pause](#pause) - Pause a subscription
* [unpause](#unpause) - Unpause a subscription
* [cancel](#cancel) - Cancel a subscription
* [get](#get) - Get a subscription
* [list](#list) - Get all subscriptions

## pause

Pauses a subscription by its ID.

### Example Usage

```python
from bolt import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as b_client:

    res = b_client.subscriptions.pause(subscription_id=921987)

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `subscription_id`                                                   | *int*                                                               | :heavy_check_mark:                                                  | ID of the subscription to pause.                                    |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.Success](../../models/success.md)**

### Errors

| Error Type      | Status Code     | Content Type    |
| --------------- | --------------- | --------------- |
| errors.APIError | 4XX, 5XX        | \*/\*           |

## unpause

Unpauses a subscription by its ID.

### Example Usage

```python
from bolt import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as b_client:

    res = b_client.subscriptions.unpause(subscription_id=438513)

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `subscription_id`                                                   | *int*                                                               | :heavy_check_mark:                                                  | ID of the subscription to unpause.                                  |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.Success](../../models/success.md)**

### Errors

| Error Type      | Status Code     | Content Type    |
| --------------- | --------------- | --------------- |
| errors.APIError | 4XX, 5XX        | \*/\*           |

## cancel

Cancels a subscription by its ID.

### Example Usage

```python
from bolt import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as b_client:

    res = b_client.subscriptions.cancel(subscription_id=111224)

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `subscription_id`                                                   | *int*                                                               | :heavy_check_mark:                                                  | ID of the subscription to cancel.                                   |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.Success](../../models/success.md)**

### Errors

| Error Type      | Status Code     | Content Type    |
| --------------- | --------------- | --------------- |
| errors.APIError | 4XX, 5XX        | \*/\*           |

## get

Retrieves a subscription by its ID.

### Example Usage

```python
from bolt import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as b_client:

    res = b_client.subscriptions.get(subscription_id=186713)

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `subscription_id`                                                   | *int*                                                               | :heavy_check_mark:                                                  | ID of the subscription to retrieve.                                 |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.Subscription](../../models/subscription.md)**

### Errors

| Error Type      | Status Code     | Content Type    |
| --------------- | --------------- | --------------- |
| errors.APIError | 4XX, 5XX        | \*/\*           |

## list

Retrieves a list of all subscriptions.

### Example Usage

```python
from bolt import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as b_client:

    res = b_client.subscriptions.list()

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `customer_ids`                                                      | *Optional[str]*                                                     | :heavy_minus_sign:                                                  | Comma-separated list of customer IDs to filter subscriptions.       |
| `emails`                                                            | *Optional[str]*                                                     | :heavy_minus_sign:                                                  | Comma-separated list of email addresses to filter subscriptions.    |
| `product_ids`                                                       | *Optional[str]*                                                     | :heavy_minus_sign:                                                  | Comma-separated list of product IDs to filter subscriptions.        |
| `plan_ids`                                                          | *Optional[str]*                                                     | :heavy_minus_sign:                                                  | Comma-separated list of plan IDs to filter subscriptions.           |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.ListSubscriptionsResponse](../../models/listsubscriptionsresponse.md)**

### Errors

| Error Type      | Status Code     | Content Type    |
| --------------- | --------------- | --------------- |
| errors.APIError | 4XX, 5XX        | \*/\*           |
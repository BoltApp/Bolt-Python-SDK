# Subscriptions

## Overview

Use the Subscriptions endpoint to manage merchant-side recurring subscriptions created through Bolt Charge: list and retrieve subscriptions, cancel or pause/unpause them, view generated orders, and configure dunning (failed payment recovery) settings for a division.


### Available Operations

* [get_subscriptions](#get_subscriptions) - Get Subscriptions
* [get_subscription](#get_subscription) - Get Subscription
* [cancel_subscription](#cancel_subscription) - Cancel Subscription
* [pause_subscription](#pause_subscription) - Pause Subscription
* [unpause_subscription](#unpause_subscription) - Unpause Subscription
* [get_subscription_orders](#get_subscription_orders) - Get Subscription Orders
* [get_dunning_settings](#get_dunning_settings) - Get Dunning Settings
* [update_dunning_settings](#update_dunning_settings) - Update Dunning Settings

## get_subscriptions

List subscriptions belonging to the authenticated merchant division. Results are limited to only show subscriptions authorized by the X-API-Key and X-Publishable-Key.

### Example Usage

<!-- UsageSnippet language="python" operationID="getSubscriptions" method="get" path="/v1/subscriptions" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.subscriptions.get_subscriptions(x_publishable_key="<value>", statuses=[
        models.SubscriptionV2Status.ACTIVE,
    ], page=1, page_size=400)

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                                                                                                                         | Type                                                                                                                                                                                                                                              | Required                                                                                                                                                                                                                                          | Description                                                                                                                                                                                                                                       |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `x_publishable_key`                                                                                                                                                                                                                               | *str*                                                                                                                                                                                                                                             | :heavy_check_mark:                                                                                                                                                                                                                                | The publicly viewable identifier used to identify a merchant division. This key is found in the Developer > API section of the Bolt Merchant Dashboard.                                                                                           |
| `x_bolt_connect_seller_id`                                                                                                                                                                                                                        | *Optional[str]*                                                                                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                                                                                | For Bolt Connect marketplace integrations, the seller's external ID. When provided, the request acts on the seller's division rather than the caller's own division. Ignored if the `seller_id` query parameter is also set.                      |
| `seller_id`                                                                                                                                                                                                                                       | *Optional[str]*                                                                                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                                                                                | For Bolt Connect marketplace integrations, the seller's external ID. When provided, the request acts on the seller's division rather than the caller's own division. Takes precedence over the `X-Bolt-Connect-Seller-Id` header if both are set. |
| `product_ids`                                                                                                                                                                                                                                     | *Optional[str]*                                                                                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                                                                                | Filter to subscriptions for these subscription product IDs. Comma-separated.                                                                                                                                                                      |
| `plan_ids`                                                                                                                                                                                                                                        | *Optional[str]*                                                                                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                                                                                | Filter to subscriptions on these plan IDs. Comma-separated.                                                                                                                                                                                       |
| `emails`                                                                                                                                                                                                                                          | *Optional[str]*                                                                                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                                                                                | Filter to subscriptions for these shopper emails. Comma-separated.                                                                                                                                                                                |
| `statuses`                                                                                                                                                                                                                                        | List[[models.SubscriptionV2Status](../../models/subscriptionv2status.md)]                                                                                                                                                                         | :heavy_minus_sign:                                                                                                                                                                                                                                | Filter to subscriptions with these statuses. Comma-separated.                                                                                                                                                                                     |
| `page`                                                                                                                                                                                                                                            | *Optional[int]*                                                                                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                                                                                | The page number to retrieve, starting at 1.                                                                                                                                                                                                       |
| `page_size`                                                                                                                                                                                                                                       | *Optional[int]*                                                                                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                                                                                | The number of subscriptions to return per page.                                                                                                                                                                                                   |
| `retries`                                                                                                                                                                                                                                         | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                                                                                                  | :heavy_minus_sign:                                                                                                                                                                                                                                | Configuration to override the default retry behavior of the client.                                                                                                                                                                               |

### Response

**[models.SubscriptionV2List](../../models/subscriptionv2list.md)**

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| errors.ErrorsBoltAPIResponse | 400, 401                     | application/json             |
| errors.APIError              | 4XX, 5XX                     | \*/\*                        |

## get_subscription

Get a single subscription by its ID. Results are limited to only show subscriptions authorized by the X-API-Key and X-Publishable-Key.

### Example Usage

<!-- UsageSnippet language="python" operationID="getSubscription" method="get" path="/v1/subscriptions/{subscription_id}" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.subscriptions.get_subscription(subscription_id="sub_1a2b3c4d5e", x_publishable_key="<value>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                               | Type                                                                                                                                                    | Required                                                                                                                                                | Description                                                                                                                                             | Example                                                                                                                                                 |
| ------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `subscription_id`                                                                                                                                       | *str*                                                                                                                                                   | :heavy_check_mark:                                                                                                                                      | The unique ID for the subscription.                                                                                                                     | sub_1a2b3c4d5e                                                                                                                                          |
| `x_publishable_key`                                                                                                                                     | *str*                                                                                                                                                   | :heavy_check_mark:                                                                                                                                      | The publicly viewable identifier used to identify a merchant division. This key is found in the Developer > API section of the Bolt Merchant Dashboard. |                                                                                                                                                         |
| `retries`                                                                                                                                               | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                        | :heavy_minus_sign:                                                                                                                                      | Configuration to override the default retry behavior of the client.                                                                                     |                                                                                                                                                         |

### Response

**[models.SubscriptionV2](../../models/subscriptionv2.md)**

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| errors.ErrorsBoltAPIResponse | 400, 401, 404                | application/json             |
| errors.APIError              | 4XX, 5XX                     | \*/\*                        |

## cancel_subscription

Cancel a subscription. This cancels any of the subscription's orders that are currently `scheduled`, `paused`, or `payment_failed`; no further orders will be placed.

### Example Usage

<!-- UsageSnippet language="python" operationID="cancelSubscription" method="post" path="/v1/subscriptions/{subscription_id}/cancel" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.subscriptions.cancel_subscription(subscription_id="sub_1a2b3c4d5e", x_publishable_key="<value>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                               | Type                                                                                                                                                    | Required                                                                                                                                                | Description                                                                                                                                             | Example                                                                                                                                                 |
| ------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `subscription_id`                                                                                                                                       | *str*                                                                                                                                                   | :heavy_check_mark:                                                                                                                                      | The unique ID for the subscription.                                                                                                                     | sub_1a2b3c4d5e                                                                                                                                          |
| `x_publishable_key`                                                                                                                                     | *str*                                                                                                                                                   | :heavy_check_mark:                                                                                                                                      | The publicly viewable identifier used to identify a merchant division. This key is found in the Developer > API section of the Bolt Merchant Dashboard. |                                                                                                                                                         |
| `retries`                                                                                                                                               | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                        | :heavy_minus_sign:                                                                                                                                      | Configuration to override the default retry behavior of the client.                                                                                     |                                                                                                                                                         |

### Response

**[models.SubscriptionV2Success](../../models/subscriptionv2success.md)**

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| errors.ErrorsBoltAPIResponse | 400, 401, 404                | application/json             |
| errors.APIError              | 4XX, 5XX                     | \*/\*                        |

## pause_subscription

Pause a subscription. This transitions the subscription's next `scheduled` order to `paused`, skipping its next billing cycle. Returns an error if the subscription is already paused.

### Example Usage

<!-- UsageSnippet language="python" operationID="pauseSubscription" method="post" path="/v1/subscriptions/{subscription_id}/pause" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.subscriptions.pause_subscription(subscription_id="sub_1a2b3c4d5e", x_publishable_key="<value>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                               | Type                                                                                                                                                    | Required                                                                                                                                                | Description                                                                                                                                             | Example                                                                                                                                                 |
| ------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `subscription_id`                                                                                                                                       | *str*                                                                                                                                                   | :heavy_check_mark:                                                                                                                                      | The unique ID for the subscription.                                                                                                                     | sub_1a2b3c4d5e                                                                                                                                          |
| `x_publishable_key`                                                                                                                                     | *str*                                                                                                                                                   | :heavy_check_mark:                                                                                                                                      | The publicly viewable identifier used to identify a merchant division. This key is found in the Developer > API section of the Bolt Merchant Dashboard. |                                                                                                                                                         |
| `retries`                                                                                                                                               | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                        | :heavy_minus_sign:                                                                                                                                      | Configuration to override the default retry behavior of the client.                                                                                     |                                                                                                                                                         |

### Response

**[models.SubscriptionV2](../../models/subscriptionv2.md)**

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| errors.ErrorsBoltAPIResponse | 400, 401, 404                | application/json             |
| errors.APIError              | 4XX, 5XX                     | \*/\*                        |

## unpause_subscription

Unpause a previously paused subscription. This computes the next billing date from the plan's frequency and reschedules the subscription's order. Returns an error if the subscription is not currently paused.

### Example Usage

<!-- UsageSnippet language="python" operationID="unpauseSubscription" method="post" path="/v1/subscriptions/{subscription_id}/unpause" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.subscriptions.unpause_subscription(subscription_id="sub_1a2b3c4d5e", x_publishable_key="<value>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                               | Type                                                                                                                                                    | Required                                                                                                                                                | Description                                                                                                                                             | Example                                                                                                                                                 |
| ------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `subscription_id`                                                                                                                                       | *str*                                                                                                                                                   | :heavy_check_mark:                                                                                                                                      | The unique ID for the subscription.                                                                                                                     | sub_1a2b3c4d5e                                                                                                                                          |
| `x_publishable_key`                                                                                                                                     | *str*                                                                                                                                                   | :heavy_check_mark:                                                                                                                                      | The publicly viewable identifier used to identify a merchant division. This key is found in the Developer > API section of the Bolt Merchant Dashboard. |                                                                                                                                                         |
| `retries`                                                                                                                                               | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                        | :heavy_minus_sign:                                                                                                                                      | Configuration to override the default retry behavior of the client.                                                                                     |                                                                                                                                                         |

### Response

**[models.SubscriptionV2](../../models/subscriptionv2.md)**

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| errors.ErrorsBoltAPIResponse | 400, 401, 404                | application/json             |
| errors.APIError              | 4XX, 5XX                     | \*/\*                        |

## get_subscription_orders

List subscription orders (billing cycles) for the authenticated merchant division.

### Example Usage

<!-- UsageSnippet language="python" operationID="getSubscriptionOrders" method="get" path="/v1/subscriptions/orders" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.subscriptions.get_subscription_orders(x_publishable_key="<value>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                                                                                                                         | Type                                                                                                                                                                                                                                              | Required                                                                                                                                                                                                                                          | Description                                                                                                                                                                                                                                       |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `x_publishable_key`                                                                                                                                                                                                                               | *str*                                                                                                                                                                                                                                             | :heavy_check_mark:                                                                                                                                                                                                                                | The publicly viewable identifier used to identify a merchant division. This key is found in the Developer > API section of the Bolt Merchant Dashboard.                                                                                           |
| `x_bolt_connect_seller_id`                                                                                                                                                                                                                        | *Optional[str]*                                                                                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                                                                                | For Bolt Connect marketplace integrations, the seller's external ID. When provided, the request acts on the seller's division rather than the caller's own division. Ignored if the `seller_id` query parameter is also set.                      |
| `seller_id`                                                                                                                                                                                                                                       | *Optional[str]*                                                                                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                                                                                | For Bolt Connect marketplace integrations, the seller's external ID. When provided, the request acts on the seller's division rather than the caller's own division. Takes precedence over the `X-Bolt-Connect-Seller-Id` header if both are set. |
| `subscription_ids`                                                                                                                                                                                                                                | *Optional[str]*                                                                                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                                                                                | Filter to orders for these subscription IDs. Comma-separated.                                                                                                                                                                                     |
| `order_ids`                                                                                                                                                                                                                                       | *Optional[str]*                                                                                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                                                                                | Filter to orders for these Bolt order IDs. Comma-separated.                                                                                                                                                                                       |
| `retries`                                                                                                                                                                                                                                         | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                                                                                                  | :heavy_minus_sign:                                                                                                                                                                                                                                | Configuration to override the default retry behavior of the client.                                                                                                                                                                               |

### Response

**[models.SubscriptionV2OrderList](../../models/subscriptionv2orderlist.md)**

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| errors.ErrorsBoltAPIResponse | 400, 401                     | application/json             |
| errors.APIError              | 4XX, 5XX                     | \*/\*                        |

## get_dunning_settings

Get the merchant division's dunning (failed payment recovery) settings. If the division has never configured these settings, Bolt's defaults are returned.

### Example Usage

<!-- UsageSnippet language="python" operationID="getDunningSettings" method="get" path="/v1/subscriptions/dunning_settings" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.subscriptions.get_dunning_settings(x_publishable_key="<value>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                                                                                                                         | Type                                                                                                                                                                                                                                              | Required                                                                                                                                                                                                                                          | Description                                                                                                                                                                                                                                       |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `x_publishable_key`                                                                                                                                                                                                                               | *str*                                                                                                                                                                                                                                             | :heavy_check_mark:                                                                                                                                                                                                                                | The publicly viewable identifier used to identify a merchant division. This key is found in the Developer > API section of the Bolt Merchant Dashboard.                                                                                           |
| `x_bolt_connect_seller_id`                                                                                                                                                                                                                        | *Optional[str]*                                                                                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                                                                                | For Bolt Connect marketplace integrations, the seller's external ID. When provided, the request acts on the seller's division rather than the caller's own division. Ignored if the `seller_id` query parameter is also set.                      |
| `seller_id`                                                                                                                                                                                                                                       | *Optional[str]*                                                                                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                                                                                | For Bolt Connect marketplace integrations, the seller's external ID. When provided, the request acts on the seller's division rather than the caller's own division. Takes precedence over the `X-Bolt-Connect-Seller-Id` header if both are set. |
| `retries`                                                                                                                                                                                                                                         | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                                                                                                  | :heavy_minus_sign:                                                                                                                                                                                                                                | Configuration to override the default retry behavior of the client.                                                                                                                                                                               |

### Response

**[models.SubscriptionV2DunningSettings](../../models/subscriptionv2dunningsettings.md)**

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| errors.ErrorsBoltAPIResponse | 401                          | application/json             |
| errors.APIError              | 4XX, 5XX                     | \*/\*                        |

## update_dunning_settings

Update the merchant division's dunning (failed payment recovery) settings. This replaces the full configuration; omitted fields are not merged with the previous settings.

### Example Usage

<!-- UsageSnippet language="python" operationID="updateDunningSettings" method="put" path="/v1/subscriptions/dunning_settings" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.subscriptions.update_dunning_settings(x_publishable_key="<value>", retry_schedule_hours=[
        24,
        72,
        168,
        336,
    ], reminder_lead_days=[
        30,
        7,
        3,
    ], final_action=models.FinalAction.CANCEL, sms_enabled=False)

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                                                                                                                         | Type                                                                                                                                                                                                                                              | Required                                                                                                                                                                                                                                          | Description                                                                                                                                                                                                                                       | Example                                                                                                                                                                                                                                           |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `x_publishable_key`                                                                                                                                                                                                                               | *str*                                                                                                                                                                                                                                             | :heavy_check_mark:                                                                                                                                                                                                                                | The publicly viewable identifier used to identify a merchant division. This key is found in the Developer > API section of the Bolt Merchant Dashboard.                                                                                           |                                                                                                                                                                                                                                                   |
| `retry_schedule_hours`                                                                                                                                                                                                                            | List[*int*]                                                                                                                                                                                                                                       | :heavy_check_mark:                                                                                                                                                                                                                                | Hour offsets from the initial payment failure at which Bolt retries the payment. Must be 1-10 strictly increasing, positive values, each at most 2160 (90 days).                                                                                  | [<br/>24,<br/>72,<br/>168,<br/>336<br/>]                                                                                                                                                                                                          |
| `reminder_lead_days`                                                                                                                                                                                                                              | List[*int*]                                                                                                                                                                                                                                       | :heavy_check_mark:                                                                                                                                                                                                                                | Days before a subscription's renewal at which Bolt sends the shopper a reminder. Must be 1-10 unique values between 1 and 90.                                                                                                                     | [<br/>30,<br/>7,<br/>3<br/>]                                                                                                                                                                                                                      |
| `final_action`                                                                                                                                                                                                                                    | [models.FinalAction](../../models/finalaction.md)                                                                                                                                                                                                 | :heavy_check_mark:                                                                                                                                                                                                                                | The action Bolt takes on a subscription once the retry schedule is exhausted without a successful payment.                                                                                                                                        | cancel                                                                                                                                                                                                                                            |
| `sms_enabled`                                                                                                                                                                                                                                     | *bool*                                                                                                                                                                                                                                            | :heavy_check_mark:                                                                                                                                                                                                                                | Whether Bolt sends SMS reminders and payment-failure notifications to the shopper, in addition to email.                                                                                                                                          | false                                                                                                                                                                                                                                             |
| `x_bolt_connect_seller_id`                                                                                                                                                                                                                        | *Optional[str]*                                                                                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                                                                                | For Bolt Connect marketplace integrations, the seller's external ID. When provided, the request acts on the seller's division rather than the caller's own division. Ignored if the `seller_id` query parameter is also set.                      |                                                                                                                                                                                                                                                   |
| `seller_id`                                                                                                                                                                                                                                       | *Optional[str]*                                                                                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                                                                                | For Bolt Connect marketplace integrations, the seller's external ID. When provided, the request acts on the seller's division rather than the caller's own division. Takes precedence over the `X-Bolt-Connect-Seller-Id` header if both are set. |                                                                                                                                                                                                                                                   |
| `retries`                                                                                                                                                                                                                                         | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                                                                                                  | :heavy_minus_sign:                                                                                                                                                                                                                                | Configuration to override the default retry behavior of the client.                                                                                                                                                                               |                                                                                                                                                                                                                                                   |

### Response

**[models.SubscriptionV2DunningSettings](../../models/subscriptionv2dunningsettings.md)**

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| errors.ErrorsBoltAPIResponse | 400, 401                     | application/json             |
| errors.APIError              | 4XX, 5XX                     | \*/\*                        |
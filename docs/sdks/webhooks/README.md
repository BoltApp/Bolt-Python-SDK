# Webhooks

## Overview

Set up webhooks to notify your backend of events within Bolt. These webhooks can communicate with your OMS or other systems to keep them up to date with Bolt. See our related guide on [Webhooks](https://help.boltapp.com/get-started/during-checkout/webhooks/).


### Available Operations

* [query_webhooks](#query_webhooks) - Query Webhooks
* [create_webhook](#create_webhook) - Create Bolt Webhook
* [delete_webhook](#delete_webhook) - Delete a Bolt Webhook
* [get_webhook](#get_webhook) - Get Webhook

## query_webhooks

Find webhook configurations belonging to a merchant division. Results are limited to only show webhooks authorized by the X-API-Key.

### Example Usage

<!-- UsageSnippet language="python" operationID="queryWebhooks" method="get" path="/v1/webhooks" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.webhooks.query_webhooks(division_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                                                                                                                                                 | Type                                                                                                                                                                                                                                                                      | Required                                                                                                                                                                                                                                                                  | Description                                                                                                                                                                                                                                                               |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `division_id`                                                                                                                                                                                                                                                             | *str*                                                                                                                                                                                                                                                                     | :heavy_check_mark:                                                                                                                                                                                                                                                        | The unique ID associated to the merchant's Bolt Account division; Merchants can have different divisions to suit multiple use cases (storefronts, pay-by-link, phone order processing). You can view and switch between these divisions from the Bolt Merchant Dashboard. |
| `retries`                                                                                                                                                                                                                                                                 | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                                                                                                                          | :heavy_minus_sign:                                                                                                                                                                                                                                                        | Configuration to override the default retry behavior of the client.                                                                                                                                                                                                       |

### Response

**[models.QueryWebhooksResponse](../../models/querywebhooksresponse.md)**

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| errors.ErrorsBoltAPIResponse | 400, 403, 404                | application/json             |
| errors.APIError              | 4XX, 5XX                     | \*/\*                        |

## create_webhook

Create a new webhook to receive notifications from Bolt about various events, such as transaction status. Webhooks must have unique configuration.

**Transaction & account events**:
* `pending` - The payment pre-authorization was successful, and the transaction is now pending fraud review.
* `failed_payment` - The payment failed pre-authorization.
* `payment` - An automatic capture transaction passed authorization and fraud review, and the system captured the funds.
* `auth` - A manual capture transaction passed authorization and fraud review, and you can begin the capture process.
* `rejected_irreversible` - The transaction failed fraud review, with no appeal option available.
* `rejected_reversible` - The transaction was flagged during fraud review; a re-review can be requested.
* `capture` - A manual capture was successful.
* `credit` - The system successfully processed a refund or credit.
* `void` - The system successfully voided the transaction.
* `newsletter_subscription` - The customer subscribed to the merchant's newsletter.
* `risk_insights` - Information about the transaction's risk is available from the fraud review.
* `credit_card_deleted` - A customer removed a saved credit card from their account.

**Subscription events**:
* `subscription_created` - A subscription was created from a successful initial transaction.
* `subscription_renewed` - A recurring subscription order was placed successfully and the next order was scheduled.
* `subscription_canceled` - A subscription was canceled, by the merchant, by the shopper, or automatically (e.g. once its dunning retry schedule is exhausted). Also sent alongside `subscription_ended` when the subscription's configured final dunning action is cancellation.
* `subscription_payment_failed` - A scheduled subscription order's payment attempt failed.
* `subscription_paused` - A subscription was paused, by the merchant, by the shopper, or automatically once its dunning retry schedule is exhausted (when the configured final dunning action is pausing).
* `subscription_unpaused` - A paused subscription was resumed, by the merchant or by the shopper.
* `subscription_ended` - A subscription was permanently ended after its dunning retry schedule was exhausted. Sent alongside `subscription_canceled` for this case.


### Example Usage

<!-- UsageSnippet language="python" operationID="createWebhook" method="post" path="/v1/webhooks" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.webhooks.create_webhook(request={
        "division_id": "3X9aPQ67-YrB",
        "url": "https://eva-nerv.shop.com/path/to/hook",
    })

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `request`                                                           | [models.CreateWebhookRequest](../../models/createwebhookrequest.md) | :heavy_check_mark:                                                  | The request object to use for the request.                          |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.CreateWebhookResponse](../../models/createwebhookresponse.md)**

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| errors.ErrorsBoltAPIResponse | 400, 403, 422                | application/json             |
| errors.APIError              | 4XX, 5XX                     | \*/\*                        |

## delete_webhook

Delete a Bolt webhook. Provide an authorized X-API-Key to perform this action.

### Example Usage

<!-- UsageSnippet language="python" operationID="deleteWebhook" method="delete" path="/v1/webhooks/{webhook_id}" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    bolt.webhooks.delete_webhook(webhook_id="wh_za7VbYcSQU2zRgGQXQAm-g")

    # Use the SDK ...

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         | Example                                                             |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `webhook_id`                                                        | *str*                                                               | :heavy_check_mark:                                                  | Webhook ID                                                          | wh_za7VbYcSQU2zRgGQXQAm-g                                           |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |                                                                     |

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| errors.ErrorsBoltAPIResponse | 400, 403, 404                | application/json             |
| errors.APIError              | 4XX, 5XX                     | \*/\*                        |

## get_webhook

Get Webhook information by its Webhook ID. Results only include webhooks authorized by the X-API-Key.

### Example Usage

<!-- UsageSnippet language="python" operationID="getWebhook" method="get" path="/v1/webhooks/{webhook_id}" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.webhooks.get_webhook(webhook_id="wh_za7VbYcSQU2zRgGQXQAm-g")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         | Example                                                             |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `webhook_id`                                                        | *str*                                                               | :heavy_check_mark:                                                  | Webhook ID                                                          | wh_za7VbYcSQU2zRgGQXQAm-g                                           |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |                                                                     |

### Response

**[models.Webhook](../../models/webhook.md)**

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| errors.ErrorsBoltAPIResponse | 400, 403, 404                | application/json             |
| errors.APIError              | 4XX, 5XX                     | \*/\*                        |
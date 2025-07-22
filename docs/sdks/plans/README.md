# Plans
(*plans*)

## Overview

### Available Operations

* [list](#list) - Get all subscription plans available for a product

## list

Retrieves a list of plans

### Example Usage

```python
from bolt import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as b_client:

    res = b_client.plans.list(merchant_product_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `merchant_product_id`                                               | *str*                                                               | :heavy_check_mark:                                                  | ID of the product to retrieve plans for.                            |
| `merchant_variant_id`                                               | *Optional[str]*                                                     | :heavy_minus_sign:                                                  | ID of the product variant to retrieve plans for.                    |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[List[models.Plan]](../../models/.md)**

### Errors

| Error Type      | Status Code     | Content Type    |
| --------------- | --------------- | --------------- |
| errors.APIError | 4XX, 5XX        | \*/\*           |
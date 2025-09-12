# Statements
(*statements*)

## Overview

[Statements](/merchants/references/financials/statements/) are available in the Merchant Dashboard for merchants who use Bolt Payments as their processor. Merchants using other processors do not receive these statements.


### Available Operations

* [get_statements](#get_statements) - Fetch a Statement

## get_statements

Get a pre-signed URL for the requested statement file.

### Example Usage

<!-- UsageSnippet language="python" operationID="getStatements" method="post" path="/v1/merchant/statement" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.statements.get_statements(request={
        "date_": 1586480400000,
        "file_type": models.StatementsFileType.CSV,
        "type": models.StatementsType.DAILY_TRANSACTION,
    })

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                     | Type                                                                          | Required                                                                      | Description                                                                   |
| ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| `request`                                                                     | [models.StatementsViewRequestBody](../../models/statementsviewrequestbody.md) | :heavy_check_mark:                                                            | The request object to use for the request.                                    |
| `retries`                                                                     | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)              | :heavy_minus_sign:                                                            | Configuration to override the default retry behavior of the client.           |

### Response

**[models.StatementsViewResponse](../../models/statementsviewresponse.md)**

### Errors

| Error Type                   | Status Code                  | Content Type                 |
| ---------------------------- | ---------------------------- | ---------------------------- |
| errors.ErrorsBoltAPIResponse | 403, 404, 422                | application/json             |
| errors.APIError              | 4XX, 5XX                     | \*/\*                        |
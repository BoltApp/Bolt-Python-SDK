# OAuth

## Overview

Use this endpoint to retrieve an OAuth token. Use the token to allow your ecommerce server to make calls to the Account endpoint and create a one-click checkout experience for shoppers. See related guide [Fetch OAuth Token](https://help.bolt.com/products/ignite/api-implementation/endpoints/oauth-guide/).


### Available Operations

* [o_auth_token](#o_auth_token) - OAuth Token Endpoint

## o_auth_token

Endpoint for receiving access, ID, and refresh tokens from Bolt's OAuth server. 

To use this endpoint, first use the Authorization Code Request flow by using the `authorization_code` Grant Type (`grant_type`). Then, in the event that you would need a second or subsequent code, use the `refresh_token` value returned from a successful request as the `refresh_token` input value in your subsequent `refresh_token` Grant Type (`grant_type`) request.

 **Reminder - the Content-Type of this request must be application/x-www-form-urlencoded**


### Example Usage: authorization_code_request

<!-- UsageSnippet language="python" operationID="OAuthToken" method="post" path="/v1/oauth/token" example="authorization_code_request" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.o_auth.o_auth_token(request_body={
        "client_id": "PUBLISHABLE_KEY_PLACEHOLDER",
        "client_secret": "API_KEY_PLACEHOLDER",
        "code": "AUTH_CODE_PLACEHOLDER",
        "grant_type": models.OAuthTokenInputGrantType.AUTHORIZATION_CODE,
        "scope": models.Scope.BOLT_ACCOUNT_VIEW,
    })

    # Handle response
    print(res)

```
### Example Usage: authorization_code_response

<!-- UsageSnippet language="python" operationID="OAuthToken" method="post" path="/v1/oauth/token" example="authorization_code_response" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.o_auth.o_auth_token()

    # Handle response
    print(res)

```
### Example Usage: refresh_token_request

<!-- UsageSnippet language="python" operationID="OAuthToken" method="post" path="/v1/oauth/token" example="refresh_token_request" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.o_auth.o_auth_token(request_body={
        "client_id": "PUBLISHABLE_KEY_PLACEHOLDER",
        "client_secret": "API_KEY_PLACEHOLDER",
        "grant_type": models.OAuthTokenInputRefreshGrantType.REFRESH_TOKEN,
        "refresh_token": "REFRESH_TOKEN_PLACEHOLDER",
        "scope": "bolt.account.view",
    })

    # Handle response
    print(res)

```
### Example Usage: refresh_token_response

<!-- UsageSnippet language="python" operationID="OAuthToken" method="post" path="/v1/oauth/token" example="refresh_token_response" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.o_auth.o_auth_token()

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                                             | Type                                                                                                                                                                  | Required                                                                                                                                                              | Description                                                                                                                                                           |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `x_publishable_key`                                                                                                                                                   | *Optional[str]*                                                                                                                                                       | :heavy_minus_sign:                                                                                                                                                    | The publicly viewable identifier used to identify a merchant division. This key is found in the Developer > API section of the Bolt Merchant Dashboard [RECOMMENDED]. |
| `request_body`                                                                                                                                                        | [Optional[models.OAuthTokenRequestBody]](../../models/oauthtokenrequestbody.md)                                                                                       | :heavy_minus_sign:                                                                                                                                                    | N/A                                                                                                                                                                   |
| `retries`                                                                                                                                                             | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                      | :heavy_minus_sign:                                                                                                                                                    | Configuration to override the default retry behavior of the client.                                                                                                   |

### Response

**[models.OAuthTokenResponse](../../models/oauthtokenresponse.md)**

### Errors

| Error Type                       | Status Code                      | Content Type                     |
| -------------------------------- | -------------------------------- | -------------------------------- |
| errors.ErrorsOauthServerResponse | 400, 403, 422                    | application/json                 |
| errors.APIError                  | 4XX, 5XX                         | \*/\*                            |
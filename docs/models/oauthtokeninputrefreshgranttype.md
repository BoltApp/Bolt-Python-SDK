# OAuthTokenInputRefreshGrantType

The type of OAuth 2.0 grant being utilized. 

The value will always be `refresh_token` when exchanging a refresh token for an access token.


## Example Usage

```python
from bolt_api_sdk.models import OAuthTokenInputRefreshGrantType

value = OAuthTokenInputRefreshGrantType.REFRESH_TOKEN
```


## Values

| Name            | Value           |
| --------------- | --------------- |
| `REFRESH_TOKEN` | refresh_token   |
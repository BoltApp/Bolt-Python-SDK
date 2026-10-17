# OAuthTokenInputGrantType

The type of OAuth 2.0 grant being utilized. 

The value will always be `authorization_code` when exchanging an authorization code for an access token.


## Example Usage

```python
from bolt_api_sdk.models import OAuthTokenInputGrantType

value = OAuthTokenInputGrantType.AUTHORIZATION_CODE
```


## Values

| Name                 | Value                |
| -------------------- | -------------------- |
| `AUTHORIZATION_CODE` | authorization_code   |
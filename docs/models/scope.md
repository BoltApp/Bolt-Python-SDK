# Scope

The scope issued to the merchant when receiving an authorization code. Options include `bolt.account.manage`, `bolt.account.view`, `openid`. You can find more information on these options in our [OAuth scope documentation](https://help.boltapp.com/developers/references/bolt-oauth/#scopes).

## Example Usage

```python
from bolt_api_sdk.models import Scope

value = Scope.BOLT_ACCOUNT_MANAGE
```


## Values

| Name                  | Value                 |
| --------------------- | --------------------- |
| `BOLT_ACCOUNT_MANAGE` | bolt.account.manage   |
| `BOLT_ACCOUNT_VIEW`   | bolt.account.view     |
| `OPENID`              | openid                |
# CreditCardAuthorizationStatus

The status of the authorization request.
  * `1` - succeeded
  * `2` - declined
  * `3` - error


## Example Usage

```python
from bolt_api_sdk.models import CreditCardAuthorizationStatus

value = CreditCardAuthorizationStatus.SUCCEEDED
```


## Values

| Name        | Value       |
| ----------- | ----------- |
| `SUCCEEDED` | succeeded   |
| `DECLINED`  | declined    |
| `ERROR`     | error       |
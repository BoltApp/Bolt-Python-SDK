# AccountIdentifierStatus

The status of the shopper account identifier (email or phone). If the account does not have this identifier, the status is "missing"; If the identifier has been used to receive an OTP code, the status is "verified"; If the identifier has not been used to receive an OTP code, the status is "unverified".

## Example Usage

```python
from bolt_api_sdk.models import AccountIdentifierStatus

value = AccountIdentifierStatus.MISSING
```


## Values

| Name         | Value        |
| ------------ | ------------ |
| `MISSING`    | missing      |
| `VERIFIED`   | verified     |
| `UNVERIFIED` | unverified   |
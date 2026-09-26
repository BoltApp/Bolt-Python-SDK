# AuthorizationVerificationStatus

Used to track the status of micro-authorizations. **Nullable** for Transactions Details. 

## Example Usage

```python
from bolt_api_sdk.models import AuthorizationVerificationStatus

value = AuthorizationVerificationStatus.NEW
```


## Values

| Name       | Value      |
| ---------- | ---------- |
| `NEW`      | new        |
| `VERIFIED` | verified   |
| `FAILED`   | failed     |
| `EXPIRED`  | expired    |
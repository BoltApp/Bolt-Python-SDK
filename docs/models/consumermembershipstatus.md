# ConsumerMembershipStatus

True if user has an AllPass membership associated to their Bolt Account. **Nullable** for Transactions Details.

## Example Usage

```python
from bolt_api_sdk.models import ConsumerMembershipStatus

value = ConsumerMembershipStatus.ACTIVE
```


## Values

| Name         | Value        |
| ------------ | ------------ |
| `ACTIVE`     | active       |
| `CANCELLED`  | cancelled    |
| `DISABLED`   | disabled     |
| `FREE_TRIAL` | free_trial   |
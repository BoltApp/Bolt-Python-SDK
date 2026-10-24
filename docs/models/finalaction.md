# FinalAction

The action Bolt takes on a subscription once the retry schedule is exhausted without a successful payment.

## Example Usage

```python
from bolt_api_sdk.models import FinalAction

value = FinalAction.CANCEL
```


## Values

| Name     | Value    |
| -------- | -------- |
| `CANCEL` | cancel   |
| `PAUSE`  | pause    |
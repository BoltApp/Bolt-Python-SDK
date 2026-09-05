# TransactionStatus

The transaction's status.

## Example Usage

```python
from bolt_api_sdk.models import TransactionStatus

value = TransactionStatus.IN_PROGRESS
```


## Values

| Name                    | Value                   |
| ----------------------- | ----------------------- |
| `IN_PROGRESS`           | in_progress             |
| `COMPLETED`             | completed               |
| `CANCELLED`             | cancelled               |
| `FAILED`                | failed                  |
| `PENDING`               | pending                 |
| `CREATED`               | created                 |
| `AUTHORIZED`            | authorized              |
| `REJECTED_REVERSIBLE`   | rejected_reversible     |
| `REJECTED_IRREVERSIBLE` | rejected_irreversible   |
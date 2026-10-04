# StatementsType

The time period and statement type: 
  * [Funding details statement](https://help.boltapp.com/operations/financials/export-funding-detail-statements/) with transactional events: Use `daily_transaction` or `monthly_transaction`
  * [Bank transfer statement](https://help.boltapp.com/operations/financials/export-bank-transfer-statements/) with settlement and funding events: Use `daily_funding`
  * [Dispute statement](https://help.boltapp.com/operations/disputes/dispute-statements/#how-to-read-dispute-statements): Use `monthly_dispute`


## Example Usage

```python
from bolt_api_sdk.models import StatementsType

value = StatementsType.DAILY_TRANSACTION
```


## Values

| Name                  | Value                 |
| --------------------- | --------------------- |
| `DAILY_TRANSACTION`   | daily_transaction     |
| `MONTHLY_TRANSACTION` | monthly_transaction   |
| `DAILY_FUNDING`       | daily_funding         |
| `MONTHLY_DISPUTE`     | monthly_dispute       |
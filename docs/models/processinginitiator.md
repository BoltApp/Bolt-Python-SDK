# ProcessingInitiator

Defines which payment method was used to initiate the transaction.

## Example Usage

```python
from bolt_api_sdk.models import ProcessingInitiator

value = ProcessingInitiator.INITIAL_CARD_ON_FILE
```


## Values

| Name                          | Value                         |
| ----------------------------- | ----------------------------- |
| `INITIAL_CARD_ON_FILE`        | initial_card_on_file          |
| `INITIAL_RECURRING`           | initial_recurring             |
| `STORED_CARDHOLDER_INITIATED` | stored_cardholder_initiated   |
| `STORED_MERCHANT_INITIATED`   | stored_merchant_initiated     |
| `FOLLOWING_RECURRING`         | following_recurring           |
| `CARDHOLDER_INITIATED`        | cardholder_initiated          |
| `RECURRING`                   | recurring                     |
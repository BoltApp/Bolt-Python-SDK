# CardNetwork

The card's network code. **Nullable** for Transactions Details. Note: LEGACY diners_club_us_ca now tagged as mastercard


## Example Usage

```python
from bolt_api_sdk.models import CardNetwork

value = CardNetwork.VISA
```


## Values

| Name           | Value          |
| -------------- | -------------- |
| `VISA`         | visa           |
| `MASTERCARD`   | mastercard     |
| `AMEX`         | amex           |
| `DISCOVER`     | discover       |
| `DINERSCLUB`   | dinersclub     |
| `JCB`          | jcb            |
| `UNIONPAY`     | unionpay       |
| `ALLIANCEDATA` | alliancedata   |
| `CITIPLCC`     | citiplcc       |
| `UNKNOWN`      | unknown        |
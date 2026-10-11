# CreditCardTokenType

Used to define which payment processor generated the token for this credit card; for those using Bolt's tokenizer, the value must be `bolt`.

## Example Usage

```python
from bolt_api_sdk.models import CreditCardTokenType

value = CreditCardTokenType.BOLT
```


## Values

| Name   | Value  |
| ------ | ------ |
| `BOLT` | bolt   |
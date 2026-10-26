# PaymentMethodAccountTokenType

Used to define which payment processor generated the token for this credit card. For those using Bolt's tokenizer, the value must be `bolt`.


## Example Usage

```python
from bolt_api_sdk.models import PaymentMethodAccountTokenType

value = PaymentMethodAccountTokenType.VANTIV
```


## Values

| Name       | Value      |
| ---------- | ---------- |
| `VANTIV`   | vantiv     |
| `APPLEPAY` | applepay   |
| `BOLT`     | bolt       |
| `STRIPE`   | stripe     |
| `PLCC`     | plcc       |
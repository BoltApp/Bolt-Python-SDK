# CardTokenType

Used to define which payment processor generated the token for this credit card.


## Example Usage

```python
from bolt_api_sdk.models import CardTokenType

value = CardTokenType.VANTIV
```


## Values

| Name                      | Value                     |
| ------------------------- | ------------------------- |
| `VANTIV`                  | vantiv                    |
| `APPLEPAY`                | applepay                  |
| `BOLT`                    | bolt                      |
| `STRIPE`                  | stripe                    |
| `PLCC`                    | plcc                      |
| `APPLEPAY_ENCRYPTED_BLOB` | applepay_encrypted_blob   |
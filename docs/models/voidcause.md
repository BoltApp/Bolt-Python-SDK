# VoidCause

Determines why the transaction was voided.

## Example Usage

```python
from bolt_api_sdk.models import VoidCause

value = VoidCause.MERCHANT_ACTION
```


## Values

| Name                        | Value                       |
| --------------------------- | --------------------------- |
| `MERCHANT_ACTION`           | merchant_action             |
| `SHOPIFY_SYNC`              | shopify_sync                |
| `PAYPAL_SYNC`               | paypal_sync                 |
| `AMAZON_PAY_SYNC`           | amazon_pay_sync             |
| `IRREVERSIBLE_REJECT`       | irreversible_reject         |
| `AUTH_EXPIRE`               | auth_expire                 |
| `AUTH_VERIFICATION_EXPIRED` | auth_verification_expired   |
| `PAYMENT_METHOD_UPDATER`    | payment_method_updater      |
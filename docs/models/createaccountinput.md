# CreateAccountInput

The details needed to create a Bolt account.


## Fields

| Field                                                                    | Type                                                                     | Required                                                                 | Description                                                              |
| ------------------------------------------------------------------------ | ------------------------------------------------------------------------ | ------------------------------------------------------------------------ | ------------------------------------------------------------------------ |
| `addresses`                                                              | List[[models.AddressAccount](../models/addressaccount.md)]               | :heavy_minus_sign:                                                       | A list of physical shipping addresses associated with this account.      |
| `payment_methods`                                                        | List[[models.PaymentMethodAccount](../models/paymentmethodaccount.md)]   | :heavy_minus_sign:                                                       | A list of payment methods associated with this account.                  |
| `profile`                                                                | [models.Profile](../models/profile.md)                                   | :heavy_check_mark:                                                       | The first name, last name, email address, and phone number of a shopper. |
# SplitsView

A split of fees by type and amount.


## Fields

| Field                                                          | Type                                                           | Required                                                       | Description                                                    | Example                                                        |
| -------------------------------------------------------------- | -------------------------------------------------------------- | -------------------------------------------------------------- | -------------------------------------------------------------- | -------------------------------------------------------------- |
| `amount`                                                       | [Optional[models.AmountView]](../models/amountview.md)         | :heavy_minus_sign:                                             | N/A                                                            |                                                                |
| `type`                                                         | [Optional[models.SplitsViewType]](../models/splitsviewtype.md) | :heavy_minus_sign:                                             | **Nullable** for Transactions Details.<br/>                    | processing_fee                                                 |
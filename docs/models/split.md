# Split

A split of fees by type and amount.


## Fields

| Field                                                            | Type                                                             | Required                                                         | Description                                                      | Example                                                          |
| ---------------------------------------------------------------- | ---------------------------------------------------------------- | ---------------------------------------------------------------- | ---------------------------------------------------------------- | ---------------------------------------------------------------- |
| `amount`                                                         | [Optional[models.AmountView]](../models/amountview.md)           | :heavy_minus_sign:                                               | N/A                                                              |                                                                  |
| `type`                                                           | [Optional[models.CaptureViewType]](../models/captureviewtype.md) | :heavy_minus_sign:                                               | Fee type options. **Nullable** for Transactions Details.<br/>    | processing_fee                                                   |
# SubscriptionV2StatusDetails

Details about the subscription's current status.


## Fields

| Field                                                            | Type                                                             | Required                                                         | Description                                                      | Example                                                          |
| ---------------------------------------------------------------- | ---------------------------------------------------------------- | ---------------------------------------------------------------- | ---------------------------------------------------------------- | ---------------------------------------------------------------- |
| `type`                                                           | [models.SubscriptionV2Status](../models/subscriptionv2status.md) | :heavy_check_mark:                                               | The current status of the subscription.                          | active                                                           |
| `reason`                                                         | *Optional[str]*                                                  | :heavy_minus_sign:                                               | Additional context for the current status, when available.       | payment_failed                                                   |
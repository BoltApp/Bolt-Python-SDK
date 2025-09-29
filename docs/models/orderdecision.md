# OrderDecision

Decision and score for an order.


## Fields

| Field                                                                    | Type                                                                     | Required                                                                 | Description                                                              | Example                                                                  |
| ------------------------------------------------------------------------ | ------------------------------------------------------------------------ | ------------------------------------------------------------------------ | ------------------------------------------------------------------------ | ------------------------------------------------------------------------ |
| `decision_factors`                                                       | List[[models.RiskDecisionFactorYml](../models/riskdecisionfactoryml.md)] | :heavy_minus_sign:                                                       | The top 5 factors of the fraud decision.                                 |                                                                          |
| `score`                                                                  | *Optional[int]*                                                          | :heavy_minus_sign:                                                       | The total fraud risk score of the order.                                 | 680                                                                      |
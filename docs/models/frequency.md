# Frequency

Describes how often the subscription recurs.


## Fields

| Field                                       | Type                                        | Required                                    | Description                                 | Example                                     |
| ------------------------------------------- | ------------------------------------------- | ------------------------------------------- | ------------------------------------------- | ------------------------------------------- |
| `unit`                                      | [Optional[models.Unit]](../models/unit.md)  | :heavy_minus_sign:                          | The unit for this subscription's frequency. | month                                       |
| `value`                                     | *Optional[int]*                             | :heavy_minus_sign:                          | The value applied to the unit frequency.    | 2                                           |
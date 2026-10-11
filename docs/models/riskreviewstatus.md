# RiskReviewStatus

Describes the current Risk Review status. A transaction could be unreviewed, reviewed, or pending manual review by the Bolt team.

## Example Usage

```python
from bolt_api_sdk.models import RiskReviewStatus

value = RiskReviewStatus.UNKNOWN
```


## Values

| Name           | Value          |
| -------------- | -------------- |
| `UNKNOWN`      | unknown        |
| `NEEDS_REVIEW` | needs_review   |
| `REVIEWED`     | reviewed       |
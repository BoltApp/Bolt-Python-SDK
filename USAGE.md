<!-- Start SDK Example Usage [usage] -->
```python
# Synchronous Example
from bolt import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as b_client:

    res = b_client.products.create(name="Bolt Subscription Product", description="This is a subscription product.", brand="Bolt", sku="BOLT-12345", unit_price=1999, plans=[
        {
            "sku": "BOLT-PLAN-12345",
            "name": "Monthly Subscription",
            "frequency": 1,
            "frequency_unit": models.CreateProductFrequencyUnit.MONTH_LOWER,
        },
    ], images=[
        "https://example.com/image1.jpg",
        "https://example.com/image2.jpg",
    ])

    # Handle response
    print(res)
```

</br>

The same SDK client can also be used to make asychronous requests by importing asyncio.
```python
# Asynchronous Example
import asyncio
from bolt import Bolt, models
import os

async def main():

    async with Bolt(
        security=models.Security(
            x_api_key=os.getenv("BOLT_X_API_KEY", ""),
        ),
    ) as b_client:

        res = await b_client.products.create_async(name="Bolt Subscription Product", description="This is a subscription product.", brand="Bolt", sku="BOLT-12345", unit_price=1999, plans=[
            {
                "sku": "BOLT-PLAN-12345",
                "name": "Monthly Subscription",
                "frequency": 1,
                "frequency_unit": models.CreateProductFrequencyUnit.MONTH_LOWER,
            },
        ], images=[
            "https://example.com/image1.jpg",
            "https://example.com/image2.jpg",
        ])

        # Handle response
        print(res)

asyncio.run(main())
```
<!-- End SDK Example Usage [usage] -->
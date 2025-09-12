<!-- Start SDK Example Usage [usage] -->
```python
# Synchronous Example
from bolt_api_sdk import Bolt, models
import os


with Bolt() as bolt:

    res = bolt.account.get_account(security=models.GetAccountSecurity(
        o_auth=os.getenv("BOLT_O_AUTH", ""),
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ))

    # Handle response
    print(res)
```

</br>

The same SDK client can also be used to make asynchronous requests by importing asyncio.
```python
# Asynchronous Example
import asyncio
from bolt_api_sdk import Bolt, models
import os

async def main():

    async with Bolt() as bolt:

        res = await bolt.account.get_account_async(security=models.GetAccountSecurity(
            o_auth=os.getenv("BOLT_O_AUTH", ""),
            x_api_key=os.getenv("BOLT_X_API_KEY", ""),
        ))

        # Handle response
        print(res)

asyncio.run(main())
```
<!-- End SDK Example Usage [usage] -->
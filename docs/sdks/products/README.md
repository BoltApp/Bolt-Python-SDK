# Products
(*products*)

## Overview

### Available Operations

* [create](#create) - Create a product
* [list](#list) - Get all products
* [get](#get) - Get a product

## create

Creates a new product with associated plans.

### Example Usage

<!-- UsageSnippet language="python" operationID="createProduct" method="post" path="/v1/subscriptions/products" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.products.create(name="Bolt Subscription Product", description="This is a subscription product.", brand="Bolt", sku="BOLT-12345", unit_price=1999, plans=[
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

### Parameters

| Parameter                                                              | Type                                                                   | Required                                                               | Description                                                            | Example                                                                |
| ---------------------------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| `name`                                                                 | *str*                                                                  | :heavy_check_mark:                                                     | Name of the product.                                                   | Bolt Subscription Product                                              |
| `description`                                                          | *str*                                                                  | :heavy_check_mark:                                                     | Description of the product.                                            | This is a subscription product.                                        |
| `brand`                                                                | *str*                                                                  | :heavy_check_mark:                                                     | Brand of the product.                                                  | Bolt                                                                   |
| `sku`                                                                  | *str*                                                                  | :heavy_check_mark:                                                     | SKU of the product.                                                    | BOLT-12345                                                             |
| `unit_price`                                                           | *int*                                                                  | :heavy_check_mark:                                                     | Unit price of the product in cents.                                    | 1999                                                                   |
| `plans`                                                                | List[[models.CreateProductPlan](../../models/createproductplan.md)]    | :heavy_check_mark:                                                     | N/A                                                                    |                                                                        |
| `merchant_product_id`                                                  | *Optional[str]*                                                        | :heavy_minus_sign:                                                     | ID for the product; if missing, global plans are created               |                                                                        |
| `merchant_variant_id`                                                  | *Optional[str]*                                                        | :heavy_minus_sign:                                                     | ID for the product variant                                             |                                                                        |
| `images`                                                               | List[*str*]                                                            | :heavy_minus_sign:                                                     | Array of image URLs for the product.                                   | [<br/>"https://example.com/image1.jpg",<br/>"https://example.com/image2.jpg"<br/>] |
| `retries`                                                              | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)       | :heavy_minus_sign:                                                     | Configuration to override the default retry behavior of the client.    |                                                                        |

### Response

**[models.CreateProductResponse](../../models/createproductresponse.md)**

### Errors

| Error Type      | Status Code     | Content Type    |
| --------------- | --------------- | --------------- |
| errors.APIError | 4XX, 5XX        | \*/\*           |

## list

Retrieves a list of all products.

### Example Usage

<!-- UsageSnippet language="python" operationID="listProducts" method="get" path="/v1/subscriptions/products" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.products.list()

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.ListProductsResponse](../../models/listproductsresponse.md)**

### Errors

| Error Type      | Status Code     | Content Type    |
| --------------- | --------------- | --------------- |
| errors.APIError | 4XX, 5XX        | \*/\*           |

## get

Retrieves a product by its ID.

### Example Usage

<!-- UsageSnippet language="python" operationID="getProduct" method="get" path="/v1/subscriptions/products/{productId}" -->
```python
from bolt_api_sdk import Bolt, models
import os


with Bolt(
    security=models.Security(
        x_api_key=os.getenv("BOLT_X_API_KEY", ""),
    ),
) as bolt:

    res = bolt.products.get(product_id="681031")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `product_id`                                                        | *str*                                                               | :heavy_check_mark:                                                  | ID of the product to retrieve.                                      |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.Product](../../models/product.md)**

### Errors

| Error Type      | Status Code     | Content Type    |
| --------------- | --------------- | --------------- |
| errors.APIError | 4XX, 5XX        | \*/\*           |
WITH raw_product AS (
    SELECT
        *
    FROM {{ source('ecommerce', 'product')}}
)
SELECT
   *
FROM raw_product

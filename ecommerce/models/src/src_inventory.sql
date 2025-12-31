WITH raw_inventory AS (
    SELECT
        *
    FROM {{ source('ecommerce', 'inventory')}}
)
SELECT
    *
FROM raw_inventory




       
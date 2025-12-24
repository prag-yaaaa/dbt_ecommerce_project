WITH raw_product AS (
    SELECT
        *
    FROM {{ source('ecommerce', 'product')}}
)
SELECT
    product_id,
    product_name,
    product_category,
    price,
    supplier_id,
    product_color,
    quantity_in_stock,
    discount_percentage
FROM raw_product
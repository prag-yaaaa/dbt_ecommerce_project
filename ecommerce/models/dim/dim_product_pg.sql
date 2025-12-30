{{
    config(
        materialized= 'view'
    )
}}
WITH src_product AS(
    SELECT * FROM {{ ref('src_product')}}
)
SELECT
    product_id,
    product_name,
    product_category,   
    price,
    discount_percentage,
    supplier_id
FROM src_product
{{ config(
   materialized='incremental',
   unique_key='product_id'
) }}

WITH src_product AS(
    SELECT * FROM {{ ref('src_product')}}
)
SELECT
    product_id,
    product_name,
    product_category,
    price,
    supplier_id,
    product_color,
    quantity_in_stock,
    discount_percentage,
    manufacturing_date,
    expiration_date,
    warranty_period,
    rating,
    weight_grams
FROM src_product


 
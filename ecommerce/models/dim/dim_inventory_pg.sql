{{
    config(
        materialized= 'view'
    )
}}
WITH src_inventory AS(
    SELECT * FROM {{ ref('src_inventory')}}
)
SELECT
    product_id,
    warehouse_id,
    stock_level,
    reorder_level,
    quantity_in_stock,
    average_monthly_demand,
    storage_condition
FROM src_inventory
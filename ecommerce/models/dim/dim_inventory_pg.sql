{{
    config(
        materialized= 'incremental',
        unique_key='inventory_id'
    )
}}
WITH src_inventory AS(
    SELECT * FROM {{ ref('src_inventory')}}
)
SELECT
    inventory_id,
    product_id,
    warehouse_id,
    stock_level,
    reorder_level,
    supplier_id,
    storage_condition,
    quantity_in_stock,
    average_monthly_demand,
    rating,
    sales_volume,
    restock_date,
    weight,
    discounts,
    safety_stock,
    inventory_status,
    last_audit_date,
    last_restock_date,
    next_restock_date
FROM src_inventory

    
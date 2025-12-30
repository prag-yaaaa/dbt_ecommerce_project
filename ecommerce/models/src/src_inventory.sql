WITH raw_inventory AS (
    SELECT
        *
    FROM {{ source('ecommerce', 'inventory')}}
)
SELECT
    product_id,
    warehouse_id,
    stock_level,
    reorder_level,
    supplier_id,
    storage_condition,
    quantity_in_stock,
    average_monthly_demand
FROM raw_inventory

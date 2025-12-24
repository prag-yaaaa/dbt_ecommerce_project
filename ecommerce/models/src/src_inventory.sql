WITH raw_inventory AS (
    SELECT
        *
    FROM {{ source('ecommerce', 'inventory')}}
)
SELECT
    product_id,
    warehouse_id,
    stock_level,
    restock_level,
    supplier_id,
    storage_condition,
    quantity_in_stock,
    avergae_monthly_demand
FROM raw_inventory

-- ENSURE ALL PRODUCT IDs IN THE MODEL EXISTS IN THE VALID_PRODUCS SOURCE TABLE
SELECT 
    vp.product_id
FROM {{ ref('fact_user_transaction_pg') }} p
LEFT JOIN {{ ref('src_product') }} vp
    ON p.product_id = vp.product_id
WHERE vp.product_id IS NULL
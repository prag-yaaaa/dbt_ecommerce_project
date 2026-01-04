{{
    config(
        materialized= 'incremental',
        unique_key=['user_id', 'search_event_id', 'product_id', 'timestamp']
    )
}}
WITH valid_users AS (
    SELECT
        user_id
    FROM {{ ref('src_user')}}
    WHERE account_status = 'active'
),
product_detail AS (
    SELECT 
        product_id
    FROM {{ ref('src_product')}}
),
user_journey AS (
    SELECT
        search_event_id,
        user_id,
        product_id,
        timestamp,
        has_qv,
        has_pdp,
        has_atc,
        has_purchase,
        session_id
    FROM {{ ref('src_journey')}}
)
SELECT
    uj.user_id,
    uj.product_id,
    uj.search_event_id,
    uj.timestamp,
    uj.has_qv,
    uj.has_pdp,
    uj.has_atc,
    uj.has_purchase,
    uj.session_id
FROM user_journey uj 
LEFT JOIN valid_users vu
    ON uj.user_id = vu.user_id
LEFT JOIN product_detail pd
    ON uj.product_id = pd.product_id
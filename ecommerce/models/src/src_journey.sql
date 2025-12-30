WITH raw_journey AS (
    SELECT
        *
    FROM {{ source('ecommerce', 'journey')}}
)
SELECT
    search_event_id,
    timestamp,
    has_qv,
    has_pdp,
    has_atc,
    has_purchase,
    product_id,
    cart_id,
    session_id,
    search_terms,
    search_type,
    user_id,
    mkt_medium,
    mkt_source,
    mkt_content,
    mkt_campaign
FROM raw_journey
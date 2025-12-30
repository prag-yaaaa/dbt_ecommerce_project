{{
    config(
        materialized= 'view'
    )
}}
WITH src_journey AS(
    SELECT * FROM {{ ref('src_journey')}}
)
SELECT
    search_event_id,
    timestamp,
    search_terms,
    search_type,
    session_id,
    cart_id
FROM src_journey
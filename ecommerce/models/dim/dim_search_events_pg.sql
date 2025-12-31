{{
    config(
        materialized= 'incremental',
        unique_key='search_event_id'
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
    cart_id,
    search_results_count AS search_results
FROM src_journey
WHERE search_event_id IS NOT NULL
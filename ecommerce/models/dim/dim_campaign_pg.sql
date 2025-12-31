{{
    config(
        materialized= 'incremental'
    )
}}
WITH src_journey AS(
    SELECT * FROM {{ ref('src_journey')}}
)
SELECT
    product_id,
    search_event_id,
    mkt_medium,
    mkt_source,
    mkt_content,
    mkt_campaign
FROM src_journey
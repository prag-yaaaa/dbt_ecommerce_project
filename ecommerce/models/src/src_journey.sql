WITH raw_journey AS (
    SELECT
        *
    FROM {{ source('ecommerce', 'journey')}}
)
SELECT
    rj.search_event_id,
    rj.timestamp,
    f.value:product_id::STRING AS product_id, -- because our data had hierarchical JSON structure data, we used flatten to extract product_id from impressions_with_attributions column
    rj.has_qv,
    rj.has_pdp,
    rj.has_atc,
    rj.has_purchase,
    rj.cart_id,
    rj.session_id,
    rj.search_terms,
    rj.search_terms_type,
    rj.search_type,
    rj.search_feature,
    rj.search_results_count,
    rj.user_id,
    rj.mkt_campaign,
    rj.mkt_source,
    rj.mkt_medium,
    rj.mkt_content,
    rj.device_class,
    rj.fulfillment_type
FROM raw_journey rj,
LATERAL FLATTEN(
    input => try_parse_json(rj.impressions_with_attributions),
    outer => TRUE
) f
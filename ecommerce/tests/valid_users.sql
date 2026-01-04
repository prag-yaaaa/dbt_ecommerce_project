-- ENSURE ALL USER_IDS in the model exists in the valid users source table

SELECT
    vu.user_id
FROM {{ ref('fact_User_Engagement_pg') }} ue
LEFT JOIN {{ ref('src_user') }} vu
    ON ue.user_id = vu.user_id
WHERE vu.user_id IS NULL
-- --- IGNORE ---
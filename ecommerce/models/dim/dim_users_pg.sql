{{
    config(
        materialized= 'incremental',
        unique_key='user_id'
    )
}}
WITH src_user AS(
    SELECT * FROM {{ ref('src_user')}}
)
SELECT
    user_id,
    first_name,
    last_name,
    CASE WHEN email not like '%_@__%.__%' THEN NULL ELSE email END AS email,
    signup_date,
    preferred_language,
    dob,
    marketing_opt_in,
    account_status,
    loyalty_points_balance
FROM src_user
WHERE account_status = 'active'
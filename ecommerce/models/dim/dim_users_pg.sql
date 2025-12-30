{{
    config(
        materialized= 'view'
    )
}}
WITH src_user AS(
    SELECT * FROM {{ ref('src_user')}}
)
SELECT
    user_id,
    first_name,
    last_name,
    email,
    signup_date,
    preferred_language,
    dob,
    marketing_opt_in,
    account_status,
    loyalty_points_balance
FROM src_user
WITH raw_user AS (
    SELECT
        *
    FROM {{ source('ecommerce', 'user')}}
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
FROM raw_user
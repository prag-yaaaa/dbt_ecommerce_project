WITH raw_user AS (
    SELECT
        *
    FROM {{ source('ecommerce', 'user')}}
)
SELECT
  *
FROM raw_user
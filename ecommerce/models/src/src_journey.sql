WITH raw_journey AS (
    SELECT
        *
    FROM {{ source('ecommerce', 'journey')}}
)
SELECT
   *
FROM raw_journey
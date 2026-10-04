WITH users AS (

    SELECT * FROM {{ ref('stg_users') }}

)

SELECT
    user_id,
    first_name,
    last_name,
    email,
    age,
    gender,
    state,
    country,
    city,
    traffic_source,
    created_at

FROM users
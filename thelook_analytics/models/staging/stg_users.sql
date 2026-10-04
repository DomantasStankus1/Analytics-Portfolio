WITH source AS (

    SELECT * FROM {{ source('thelook', 'raw_users') }}

),

renamed AS (

    SELECT
        id as user_id,
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

    FROM source

)

SELECT * FROM renamed
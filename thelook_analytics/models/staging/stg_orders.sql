WITH source AS (

    SELECT * FROM {{ source('thelook', 'raw_orders') }}

),

renamed as (

    SELECT
        order_id,
        user_id,
        status,
        gender,
        created_at,
        shipped_at,
        delivered_at,
        returned_at,
        num_of_item

    FROM source

)

SELECT * FROM renamed
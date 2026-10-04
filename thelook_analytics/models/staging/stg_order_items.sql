WITH source AS (

    SELECT * FROM {{ source('thelook', 'raw_order_items') }}

),

renamed AS (

    SELECT
        id as order_item_id,
        order_id,
        user_id,
        product_id,
        inventory_item_id,
        status,
        sale_price,
        created_at,
        shipped_at,
        delivered_at,
        returned_at

    FROM source

)

SELECT * FROM renamed
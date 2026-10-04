WITH orders AS (

    SELECT * FROM {{ ref('stg_orders') }}

)

SELECT
    order_id,
    user_id,
    status,
    created_at,
    shipped_at,
    delivered_at,
    returned_at,
    num_of_item

FROM orders	
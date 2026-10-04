WITH products AS (

    SELECT * FROM {{ ref('stg_products') }}

)

SELECT
    product_id,
    product_name,
    category,
    brand,
    department,
    cost,
    retail_price

FROM products
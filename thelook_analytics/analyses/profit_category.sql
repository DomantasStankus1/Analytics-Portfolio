-- analize

WITH products AS (

SELECT
product_id,
category,
cost
FROM {{ ref('stg_products') }}

),

fact AS (

SELECT
product_id,
sale_price
FROM {{ ref('stg_order_items') }}

),

combined AS (

SELECT
p.category,
SUM(f.sale_price - p.cost) AS profit
FROM fact AS f
LEFT JOIN products AS p
    ON f.product_id = p.product_id
GROUP BY p.category

)

SELECT
*
FROM combined
ORDER BY profit DESC
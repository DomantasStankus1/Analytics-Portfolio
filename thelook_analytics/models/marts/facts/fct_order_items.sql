WITH order_items AS (
	SELECT
	*
	FROM {{ ref('stg_order_items') }}
),

products AS (
	SELECT
	*
	FROM {{ ref('stg_products') }}
),

joined AS (
	SELECT
	-- raktai (nuorodos į dimensijas)
	order_items.order_item_id,
        order_items.order_id,
        order_items.user_id,
        order_items.product_id,

	-- statusas ir datos
	order_items.status,
        order_items.created_at,
        order_items.returned_at,

	-- matai (skaičiai)
	order_items.sale_price,
        products.cost,
        order_items.sale_price - products.cost as profit   -- apskaičiuotas matas: pelnas

	FROM order_items
	LEFT JOIN products
		ON order_items.product_id = products.product_id
)

SELECT
*
FROM joined
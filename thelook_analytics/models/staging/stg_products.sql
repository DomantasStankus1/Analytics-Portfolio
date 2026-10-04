WITH source AS (

    SELECT * FROM {{ source('thelook', 'raw_products') }}

),

renamed AS (

    SELECT
        id as product_id,
        name as product_name,
        category,
        brand,
        department,
        cost,
        retail_price

    FROM source

)

SELECT * FROM renamed
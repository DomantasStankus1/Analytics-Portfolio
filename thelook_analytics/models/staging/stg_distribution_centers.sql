WITH source AS (

    SELECT * FROM {{ source('thelook', 'raw_distribution_centers') }}

),

renamed AS (

    SELECT
        id as distribution_center_id,
        name as distribution_center_name

    FROM source

)

SELECT * FROM renamed
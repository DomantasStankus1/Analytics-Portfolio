WITH distribution_centers AS (

    SELECT * FROM {{ ref('stg_distribution_centers') }}

)

SELECT
    distribution_center_id,
    distribution_center_name

FROM distribution_centers
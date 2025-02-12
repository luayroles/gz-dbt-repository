with 

source as (

    select * from {{ source('raw', 'adwords') }}

),

renamed as (

    select
        date_date,
        paid_source,
        CONCAT(date_date,"_",campaign_key) AS primary_key,
        CASE
        WHEN campaign_key IS NULL THEN "NA"
        END AS campaign_key,
        campgn_name AS campaign_name,
        CAST(ads_cost AS FLOAT64) AS ads_cost,
        impression,
        click

    from source

)

select * from renamed

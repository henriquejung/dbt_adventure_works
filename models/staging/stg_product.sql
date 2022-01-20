with
    source_data as(
        select
            productid
            , name as product_name
        from {{ source('adventure_kondado_source', 'production_product') }} 
    )
select *
from source_data
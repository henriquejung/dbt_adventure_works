with
    source_data as(
        select
            businessentityid
            , name as customer_name
        from {{ source('adventure_kondado_source', 'sales_store') }} 
    )
select *
from source_data
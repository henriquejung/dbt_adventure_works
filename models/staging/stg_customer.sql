with
    source_data as(
        select
            customerid
            , storeid
        from {{ source('adventure_kondado_source', 'sales_customer') }} 
    )
select *
from source_data
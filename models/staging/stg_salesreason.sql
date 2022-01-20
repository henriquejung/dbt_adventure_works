with
    source_data as(
        select
            salesreasonid
            , name as sales_reason
        from {{ source('adventure_kondado_source', 'sales_salesreason') }} 
    )
select *
from source_data
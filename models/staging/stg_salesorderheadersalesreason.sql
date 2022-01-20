with
    source_data as(
        select 
            salesorderid
            , salesreasonid
        from {{ source('adventure_kondado_source', 'sales_salesorderheadersalesreason') }}
        order by salesorderid 
    )
select *
from source_data
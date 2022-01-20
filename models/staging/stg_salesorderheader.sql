with
    source_data as(
        select
            salesorderid
            , orderdate
            , customerid
            , shiptoaddressid
            , creditcardid
        from {{ source('adventure_kondado_source', 'sales_salesorderheader') }} 
    )
select *
from source_data
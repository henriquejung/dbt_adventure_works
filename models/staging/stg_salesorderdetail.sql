with
    source_data as(
        select
            salesorderid
            ,salesorderdetailid
            , orderqty
            , productid
            , unitprice
        from {{ source('adventure_kondado_source', 'sales_salesorderdetail') }} 
    )
select *
from source_data
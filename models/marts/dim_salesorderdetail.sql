with 
    staging as (
        select *
        from{{ref('stg_salesorderdetailFINAL')}}
    )
    , transformed as (
        select
            row_number() over (order by salesorderdetailid) as salesorderdetail_sk
            , salesorderid
            , orderqty
            , unitprice
            , product_name
            , salesorderdetailid
        from staging
    )
select * 
from transformed

with 
    staging as (
        select *
        from{{ref('stg_customerFINAL')}}
    )
    , transformed as (
        select
            row_number() over (order by customerid) as customer_sk
            , customerid
            , customer_name
        from staging
    )
select * 
from transformed

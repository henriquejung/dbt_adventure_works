with 
    staging as (
        select *
        from{{ref('stg_salesreasonFINAL')}}
    )
    , transformed as (
        select
            row_number() over (order by salesorderid) as salesreason_sk
            , salesorderid
            , sales_reason
            , hsalesreasonid
        from staging
    )
select * 
from transformed

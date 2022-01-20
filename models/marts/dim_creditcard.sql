with 
    staging as (
        select *
        from{{ref('stg_creditcard')}}
    )
    , transformed as (
        select
            row_number() over (order by creditcardid) as creditcard_sk
            , creditcardid
            , cardtype
        from staging
    )
select * 
from transformed
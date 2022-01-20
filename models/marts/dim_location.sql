with 
    staging as (
        select *
        from{{ref('stg_location')}}
    )
    , transformed as (
        select
            row_number() over (order by addressid) as address_sk
            , addressid
            , city
            , state_name
            , country_name
        from staging
    )
select * 
from transformed

with
    
    salesreason as (
        select
            r.salesreason_sk
            , r.salesorderid
        from {{ref('dim_salesreason')}} r
    )
    , orders as (
        select
            orders.salesorderid
        from {{ref('stg_salesorderheader')}} orders
    )
    , final as (
        select
            orders.salesorderid as orders_sk
            , salesreason.salesreason_sk as salesreason_fk
        from orders
        left join salesreason on orders.salesorderid = salesreason.salesorderid
    )
select *
from final
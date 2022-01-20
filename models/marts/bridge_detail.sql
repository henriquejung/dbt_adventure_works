with
    
    salesorderdetail as (
        select
            detail.salesorderdetail_sk
            , detail.salesorderid
        from {{ref('dim_salesorderdetail')}} detail
    )
    , orders as (
        select
            orders.salesorderid
        from {{ref('stg_salesorderheader')}} orders
    )
    , final as (
        select
            orders.salesorderid as orders_sk
            , salesorderdetail.salesorderdetail_sk as salesorderdetail_fk
        from orders
        left join salesorderdetail on orders.salesorderid = salesorderdetail.salesorderid
    )
select *
from final
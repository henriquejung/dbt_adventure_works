with
    pr as (
        select 
            product.productid
            , product.product_name
        from {{ ref('stg_product') }} product
    )
    , od as(
        select
            order_detail.salesorderid
            , order_detail.orderqty
            , order_detail.productid
            , order_detail.unitprice
            , order_detail.salesorderdetailid
        from {{ref('stg_salesorderdetail') }} order_detail
    )
    , final as (
        select *
        from od
        left join pr on od.productid = pr.productid 
    )
select salesorderid, orderqty, unitprice, product_name, salesorderdetailid
from final
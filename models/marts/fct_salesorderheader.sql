with
    
    location as (
        select
            address_sk
            , addressid
        from {{ref('dim_location')}}
    )
    , bridgedetails as (
        select distinct
            orders_sk as bridgedetail_fk
        from {{ref('bridge_detail')}}
    )
    , customer as (
        select distinct
            c.customer_sk
            , c.customerid
        from {{ref('dim_customer')}} c
    )
    , bridgereason as (
        select distinct
            rb.orders_sk as bridgereason_fk
        from {{ref('bridge_reason')}} rb
    )
    , creditcard as (
        select
            creditcard_sk
            , creditcardid
        from {{ref('dim_creditcard')}}
    )
    , orders_with_sk as (
        select
            orders.salesorderid
            , orders.shiptoaddressid
            , orders.orderdate
            , orders.creditcardid 
            , location.address_sk as address_fk
            , customer.customer_sk as customer_fk
            , creditcard.creditcard_sk as credit_fk
            , bridgedetails.bridgedetail_fk
            , bridgereason.bridgereason_fk
        from {{ref('stg_salesorderheader')}} orders
        
        left join location  on orders.shiptoaddressid = location.addressid
        left join creditcard  on orders.creditcardid = creditcard.creditcardid
        left join customer  on orders.customerid = customer.customerid
        left join bridgedetails  on orders.salesorderid = bridgedetails.bridgedetail_fk
        left join bridgereason  on orders.salesorderid = bridgereason.bridgereason_fk
    )
    , final as (
        select
            salesorderid
            , orderdate
            , address_fk
            , customer_fk
            , credit_fk
            , bridgedetail_fk
            , bridgereason_fk
        from orders_with_sk
    )
select *
from final

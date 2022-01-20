with
    st as (
        select 
            store.businessentityid
            , store.customer_name
        from {{ ref('stg_stores') }} store
    )
    , cus as(
        select
            cs.customerid
            , cs.storeid
        from {{ref('stg_customer') }} cs
    )

    , final as (
        select *
        from cus
        left join st on cus.storeid = st.businessentityid
    )
select customerid, customer_name
from final

with
    hd as (
        select 
            head.salesorderid
            , head.salesreasonid as hsalesreasonid
        from {{ ref('stg_salesorderheadersalesreason') }} head
    )
    , rs as(
        select
            reason.salesreasonid
            , reason.sales_reason
        from {{ref('stg_salesreason') }} reason
    )
    , final as (
        select 
            hd.salesorderid
            , hd.hsalesreasonid
            , rs.sales_reason
        from hd
        inner join rs on hd.hsalesreasonid = rs.salesreasonid 
    )
select salesorderid, sales_reason, hsalesreasonid
from final
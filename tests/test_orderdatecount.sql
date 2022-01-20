with
    validation as (
        select 
            count(orderdate) as sum_val
        from{{ref('fct_salesorderheader')}}
    )
select *
from validation 
where sum_val != 31465
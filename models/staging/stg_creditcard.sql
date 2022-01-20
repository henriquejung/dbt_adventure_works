with
    source_data as(
        select
            creditcardid
            , cardtype
        from {{ source('adventure_kondado_source', 'sales_creditcard') }} 
    )
select *
from source_data
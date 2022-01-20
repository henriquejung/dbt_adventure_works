with
    source_data as (

        select 
            addressid 
            , city
            , stateprovinceid
        from {{ source('adventure_kondado_source', 'person_address') }}
    )
    
select *
from source_data

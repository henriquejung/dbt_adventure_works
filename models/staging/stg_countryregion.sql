with
    source_data as(
        select
            countryregioncode
            , name
        from {{ source('adventure_kondado_source', 'person_countryregion') }} 
    )
select *
from source_data
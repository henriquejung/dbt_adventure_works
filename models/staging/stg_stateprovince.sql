with
     st as(
        select
            state.stateprovinceid
            , state.countryregioncode
            , state.name
        from {{source('adventure_kondado_source', 'person_stateprovince') }} state
    )

select *
from st

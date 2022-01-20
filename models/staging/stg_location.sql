with
    cr as (

        select 
            country.countryregioncode
            , country.name as country_name
        from {{ ref('stg_countryregion') }} country
    )
    , st as(
        select
            state.stateprovinceid
            , state.countryregioncode
            , state.name
        from {{ref('stg_stateprovince') }} state
    )

    , ad as (

        select 
            address.addressid 
            , address.city
            , address.stateprovinceid
        from {{ ref('stg_address') }} address
    )

    , final as (
        select *
        from ad
        left join st on ad.stateprovinceid = st.stateprovinceid 
        left join cr on st.countryregioncode = cr.countryregioncode
    )
select addressid, city, name as state_name, country_name
from final
{% macro create_filtered_covid_data(country) %}

    with covid_data as (

        select 
        CAST(date AS DATE)                         AS date,
        CAST(confirmed AS INT64)                   AS total_confirmed,
        CAST(deaths AS INT64)                      AS total_deaths,
        CAST(recovered AS INT64)                   AS total_recovered,
        CAST(confirmed_diff AS INT64)              AS daily_confirmed,
        CAST(deaths_diff AS INT64)                 AS daily_deaths,
        CAST(recovered_diff AS INT64)              AS recovered_confirmed,
        CAST(last_update AS TIMESTAMP)             AS last_update,
        CAST(active AS INT64)                      AS total_active,
        CAST(active_diff AS INT64)                 AS daily_active,
        CAST(fatality_rate AS FLOAT64)             AS fatality_rate,
        CAST(region_iso AS STRING)                 AS country_iso,
        CAST(region_name AS STRING)                AS country_name,
        CAST(region_province AS STRING)            AS country_state,
        CAST(ROUND(region_lat, 4) AS FLOAT64)      AS state_lat,
        CAST(ROUND(region_long, 4) AS FLOAT64)     AS state_long,
        CAST(region_cities AS STRING)              AS cities_cases
        from COVID_DATA_RAW.covid_data where region_name = {{ country }}

    )

    select *
    from covid_data


    
{% endmacro %}
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
        CAST(JSON_EXTRACT_SCALAR(region, '$.iso') AS STRING) AS country_iso,
        CAST(JSON_EXTRACT_SCALAR(region, '$.name') AS STRING) AS country_name,
        CAST(JSON_EXTRACT_SCALAR(region, '$.province') AS STRING) AS state_name,
        CAST(JSON_EXTRACT_SCALAR(region, '$.lat') AS FLOAT64) AS latitude,
        CAST(JSON_EXTRACT_SCALAR(region, '$.long') AS FLOAT64) AS longitude,
        from COVID_DATA_RAW.covid_data where JSON_EXTRACT_SCALAR(region, '$.name') = {{ country }}

    )

    select *
    from covid_data


    
{% endmacro %}
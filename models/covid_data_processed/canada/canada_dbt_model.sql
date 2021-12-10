{{ config(
    materialized='table',
    partition_by={
      "field": "date",
      "data_type": "date",
      "granularity": "day"
    }
    ) 
}}


{{ create_filtered_covid_data( "'Canada'" ) }}

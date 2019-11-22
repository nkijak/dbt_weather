{{ config(materialized='table') }}
select 
  station_identifier,
  measurement_date,
  min(CASE WHEN measurement_type='SNOW' THEN measurement_flag END) AS snow_fall_cm,
  min(CASE WHEN measurement_type='TMIN' THEN measurement_flag END) / 10.0 AS lo_temp_celsius,
  min(CASE WHEN measurement_type='TMAX' THEN measurement_flag END) / 10.0 AS hi_temp_celsius,
  min(CASE WHEN measurement_type='PRCP' THEN measurement_flag END) AS precipitation_amount_cm,
  min(CASE WHEN measurement_type='SNWD' THEN measurement_flag END) AS snow_depth_cm
from
  {{ ref('base_weather_data') }}
group by
  station_identifier, measurement_date

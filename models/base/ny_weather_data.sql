{{ config(materialized='ephemeral') }}
  select
    40.7829 as latitude,
    73.9654 as longitude,
    cast('NYCCP' as varchar) as station_id,
    (maximum_temperature - 32) * 5.0/9.0 as max_celsius,
    (minimum_temperature - 32) * 5.0/9.0 as min_celsius,
    maximum_temperature as max_fahrenheit,
    minimum_temperature as min_fahrenheit,
    case when precipitation='T' THEN 0 ELSE cast(precipitation as float) end precipitation_cm,
    case when snow_fall='T' THEN 0 ELSE cast(snow_fall as float) end snow_fall_cm,
    case when snow_depth='T' THEN 0 ELSE cast(snow_depth as float) end snow_depth_cm,
    to_date(date, 'YYYY-MM-DD') as date
  from {{ ref('weather_data') }}

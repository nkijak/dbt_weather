select
  w.measurement_date,
  w.snow_fall_cm,
  least(lo_temp_celsius, hi_temp_celsius) lo_temp_celsius,
  greatest(lo_temp_celsius, hi_temp_celsius) hi_temp_celsius,
  w.precipitation_amount_cm,
  w.snow_depth_cm,
  s.climate_id,
  s.hemisphere_id,
  s.id as station_id,
  date_part('year', w.measurement_date) as year_id
from
  {{ ref('flattened_weather_data') }} w
JOIN {{ ref('station') }} s ON w.station_identifier = s.station_id
WHERE
  least(lo_temp_celsius, hi_temp_celsius) > -90.0 and w.hi_temp_celsius < 90 

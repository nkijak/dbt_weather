select
  s.latitude,
  s.longitude,
  s.elevation,
  w.measurement_date,
  w.lo_temp_celsius min_temp_celcius,
  w.hi_temp_celsius max_temp_celcius,
  (w.lo_temp_celsius * 9/5) + 32 min_temp_fahrenheit,
  (w.hi_temp_celsius  * 9/5) + 32 max_temp_fahrenheit,
  s.station_id station_id,
  dcz.name climate_type,
  dcz.pole climate_pole,
  dh.name hemisphere
from
  {{ ref('weather') }} w
join {{ ref('station') }} s on w.station_id = s.id
join {{ ref('dim_climate_zones') }} dcz on s.climate_id = dcz.id
join {{ ref('dim_hemisphere') }} dh on s.hemisphere_id = dh.id
where 
  w.lo_temp_celsius is not null 
  AND w.hi_temp_celsius is not null


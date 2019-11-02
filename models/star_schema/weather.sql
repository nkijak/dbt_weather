select 
  date_part('month', w.date) month_id,
  date_part('year', w.date) year_id,
  w.season_id,
  w.date,
  w.min_celsius,
  w.max_celsius,
  w.min_fahrenheit,
  w.max_fahrenheit,
  w.station_id,
  w.latitude,
  w.longitude,
  w.precipitation_cm,
  w.snow_fall_cm,
  w.snow_depth_cm
from {{ ref('star_base') }} w
where rank=1

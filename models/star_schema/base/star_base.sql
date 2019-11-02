with cte as (select
  w.*,
  ds.id as season_id,
  (date_part('month', ds.fin) - date_part('month', w.date)) * 100 +
    date_part('day', ds.fin) - date_part('day', w.date) season_dist,
  ds.fin fin,
  date_part('month', ds.fin) fin_mon,
  date_part('month', w.date) date_mon,
  date_part('day', ds.fin) fin_day,
  date_part('day', w.date) date_day,
  age(w.date, ds.fin) age
from
  {{ ref('ny_weather_data') }} w,
  {{ ref('dim_seasons') }} ds
 where (date_part('month', ds.fin) - date_part('month', w.date)) * 100 +
    date_part('day', ds.fin) - date_part('day', w.date) >= 0
)
select 
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
  w.snow_depth_cm,
  rank() OVER (
    PARTITION BY station_id, date 
    ORDER BY season_dist 
  ) rank
from cte w


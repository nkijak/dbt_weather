select
  station_id,
  measurement_date
from {{ ref('weather') }}
where 
  (lo_temp_celsius > hi_temp_celsius)
  or
  (lo_temp_celsius < -90) -- bad data seems to be represented by -99.0
  or
  (hi_temp_celsius > 90)


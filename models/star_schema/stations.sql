select distinct
  latitude,
  longitude,
  station_id as id
from {{ ref('ny_weather_data') }}

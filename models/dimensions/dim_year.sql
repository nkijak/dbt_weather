select 
  distinct date_part('year', measurement_date) id
from
  {{ ref('flattened_weather_data') }}

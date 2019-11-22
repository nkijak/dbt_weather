select 
  distinct measurement_type
from {{ ref('base_weather_data') }}

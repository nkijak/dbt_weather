select *
from {{ source('raw', 'weather_data') }}

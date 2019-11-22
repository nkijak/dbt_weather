select 
  *
from {{ source('raw', 'station_metadata') }}

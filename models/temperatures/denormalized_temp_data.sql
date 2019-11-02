select 
  w.max_celsius,
  w.min_celsius,
  dm.long,
  ds.name,
  w.date,
  w.station_id
from {{ ref('weather') }} w
join {{ ref('dim_month') }} dm on dm.id=w.month_id
join {{ ref('dim_seasons') }} ds on ds.id=w.season_id

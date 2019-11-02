select
  w.season_id,
  s.name
from {{ ref('weather') }} w
join {{ ref('dim_seasons') }} s on s.id = w.season_id
where
  (w.date = '2016-06-19' and s.name != 'spring') or
  (w.date = '2016-06-22' and s.name != 'summer')

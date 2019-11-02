select
  avg(w.max_fahrenheit) avg_hi_f,
  avg(w.min_fahrenheit) avg_lo_f,
  avg(w.max_celsius) avg_hi_c,
  avg(w.min_celsius) avg_lo_c,
  s.name season
from {{ ref('weather') }} w
JOIN {{ ref('dim_seasons') }} s
ON w.season_id = s.id
GROUP BY w.station_id, s.name
ORDER BY w.station_id

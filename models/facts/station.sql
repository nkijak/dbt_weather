select
  s.*,
  dcz.id climate_id,
  dh.id hemisphere_id
from {{ ref('base_station_data') }} s
JOIN {{ ref('dim_climate_zones') }} dcz ON s.latitude BETWEEN dcz.latitude_start AND dcz.latitude_end
JOIN {{ ref('dim_hemisphere') }} dh ON s.longitude BETWEEN dh.longitude_start AND dh.longitude_end

{{ config(severity='warn') }}
with checks as (select
  case
  when min_celsius > max_celsius then 1
  else 0
  end as test
from {{ ref('denormalized_temp_data') }}
)
select * from checks where test = 1

with checks as (
  select count(*) c from {{ ref('avg_hi_lo_by_season') }}
)
select * from checks where c <= 1

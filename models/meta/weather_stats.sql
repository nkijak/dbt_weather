-- depends_on: {{ ref('weather') }}
{% call statement('column_names', fetch_result=True) %}

select column_name
from information_schema.columns 
where table_name='{{ ref('weather').table }}'
and data_type in ('numeric', 'integer', 'double precision')

{% endcall %}
{% set columns = load_result('column_names').table.columns['column_name'].values() %}
with
{% for column in columns %}
cte_{{column}} as (
  select
    avg({{ column }}) avg,
    max({{ column }}) max,
    min({{ column }}) min,
    stddev({{ column }}) stddev,
    variance({{ column }}) variance,
    sum(case when {{ column }} is null then 1 else 0 end) null_count
  from
    {{ ref('weather') }}
){%- if not loop.last -%},{%- endif %}
{% endfor %}
{% for column in columns %}
select now() as updated_at, '{{ column }}' as column_name, avg, max, min, stddev, variance, null_count from cte_{{ column }}
{% if not loop.last %}UNION ALL{% endif %}
{% endfor %}


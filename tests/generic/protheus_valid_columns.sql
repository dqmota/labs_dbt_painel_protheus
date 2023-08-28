{% test protheus_valid_columns(model) %}

with validation as (

    select
        protheus_pk, company

    from {{ model }}

),

validation_errors as (

  select true
  from validation
  where protheus_pk is null
    or company is null

)

select *
from validation_errors

{% endtest %}
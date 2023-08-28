select true from (
  select TRIM(A1_CGC) as field
  from {{ source('protheus','sa1') }}
  where NULLIF(TRIM(A1_CGC), '') is not null
)
where not REGEXP_CONTAINS(field, r'(\d{11}|\d{14})')
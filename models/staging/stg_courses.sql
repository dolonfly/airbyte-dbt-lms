with source AS (
    select * from {{source('lms','_airbyte_raw_courses')}}
),

flattened_json_data AS (
  SELECT
    JSON_EXTRACT(_airbyte_data,'$.id') AS id,
    JSON_EXTRACT(_airbyte_data,'$.name') AS `name`,
    JSON_EXTRACT(_airbyte_data,'$.workflow_state') AS workflow_state,
    JSON_EXTRACT(_airbyte_data,'$.created_at') AS created_at,
    JSON_EXTRACT(_airbyte_data,'$.updated_at') AS updated_at
  FROM source
)

select * from flattened_json_data
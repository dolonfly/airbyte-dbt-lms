with source AS (
    select * from {{source('lms','_airbyte_raw_users')}}
),

flattened_json_data AS (
  SELECT
    -- JSON_EXTRACT(_airbyte_data,'$.id') AS id,
    -- JSON_EXTRACT(_airbyte_data,'$.name') AS user_name,
    -- JSON_EXTRACT(_airbyte_data,'$.uuid') AS uuid,
    -- JSON_EXTRACT(_airbyte_data,'$.phone') AS phone,
    -- JSON_EXTRACT(_airbyte_data,'$.lti_id') AS lti_id,
    -- JSON_EXTRACT(_airbyte_data,'$.created_at') AS created_at,
    -- JSON_EXTRACT(_airbyte_data,'$.deleted_at') AS deleted_at,
    -- JSON_EXTRACT(_airbyte_data,'$.updated_at') AS updated_at
    _airbyte_data.JSONExtractValue('$.id') AS id,
    _airbyte_data.JSONExtractValue('$.name') AS user_name,
    _airbyte_data.JSONExtractValue('$.uuid') AS uuid,
    _airbyte_data.JSONExtractValue('$.phone') AS phone,
    _airbyte_data.JSONExtractValue('$.lti_id') AS lti_id,
    _airbyte_data.JSONExtractValue('$.created_at') AS created_at,
    _airbyte_data.JSONExtractValue('$.deleted_at') AS deleted_at,
    _airbyte_data.JSONExtractValue('$.updated_at') AS updated_at
  FROM source
)

select * from flattened_json_data
with courses as (
    select * from {{ref('stg_courses')}}
),


final as (
    select id,name,workflow_state,created_at,updated_at from courses
    --  where workflow_state="available"
)

select * from final
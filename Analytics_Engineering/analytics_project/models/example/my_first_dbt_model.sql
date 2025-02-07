
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

with source_data as (
    select 1 as id
    union all
    select null as id
)

select 
    coalesce(id, -1) as id  -- ✅ Ersetzt NULL durch -1
from source_data




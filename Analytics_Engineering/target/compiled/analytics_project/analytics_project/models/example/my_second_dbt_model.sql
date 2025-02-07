-- Use the `ref` function to select from other models

select *
from "analytics_project"."ANALYTICS_STAGINGsetx PGUSER postgres /M"."my_first_dbt_model"
where id = 1
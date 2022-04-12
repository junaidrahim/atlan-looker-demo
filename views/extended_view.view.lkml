include: "/views/*"

view: extended_views_stg_customers {
  sql_table_name: PUBLIC"."STG_CUSTOMERS"
  ;;
  extends: [stg_orders]
}

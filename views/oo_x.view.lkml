# The name of this view in Looker is "Oo X"
view: oo_x {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "PUBLIC"."OO_X"
    ;;
  drill_fields: [user_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: user_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."user_id" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Count of Product ID" in Explore.

  dimension: count_of_product_id {
    type: number
    sql: ${TABLE}."count of product_id" ;;
  }

  measure: count {
    type: count
    drill_fields: [user_id]
  }
}

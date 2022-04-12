# The name of this view in Looker is "Raw Payments"
view: raw_payments {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "PUBLIC"."RAW_PAYMENTS"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Amount" in Explore.

  dimension: amount {
    type: number
    sql: ${TABLE}."AMOUNT" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_amount {
    type: sum
    sql: ${amount} ;;
  }

  measure: average_amount {
    type: average
    sql: ${amount} ;;
  }

  # dimension: id {
  #   type: number
  #   sql: ${TABLE}."ID" ;;
  # }

  # dimension: order_id {
  #   type: number
  #   sql: ${TABLE}."ORDER_ID" ;;
  # }

  # dimension: payment_method {
  #   type: string
  #   sql: ${TABLE}."PAYMENT_METHOD" ;;
  # }

  measure: count {
    type: count
    drill_fields: []
  }
}

view: customer_order_details {

  derived_table: {
    persist_for: "24 hours"

    sql: SELECT
       O.CUSTOMER_ID,
       O.ORDER_ID,
       O.STATUS AS ORDER_STATUS,
       C.FIRST_NAME,
       C.LAST_NAME

      FROM
       ${stg_customers.SQL_TABLE_NAME} AS C
      JOIN (
      SELECT * from

      ${stg_orders.SQL_TABLE_NAME}


      ) AS O ON
      C.CUSTOMER_ID=O.CUSTOMER_ID
      ;;
  }
    # PUBLIC.STG_CUSTOMERS
    #  PUBLIC.STG_ORDERS

  measure: count {

    type: count
    drill_fields: [detail*]
  }

  dimension: customer_id {
    description: "customer order id "
    type: number
    sql: ${TABLE}."CUSTOMER_ID" ;;
  }

  dimension: order_id {
    description: "order id which is number not string"
    type: number
    sql: ${TABLE}."ORDER_ID" ;;
  }

  dimension: order_status {
    description: "order status "
    type: string
    sql: ${TABLE}."ORDER_STATUS" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."FIRST_NAME" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."LAST_NAME" ;;
  }

  set: detail {
    fields: [customer_id, order_id, order_status, first_name, last_name]
  }
}

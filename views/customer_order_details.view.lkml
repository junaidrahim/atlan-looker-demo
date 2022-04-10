view: customer_order_details {
  derived_table: {
    sql: SELECT
       O.CUSTOMER_ID,
       O.ORDER_ID,
       O.STATUS AS ORDER_STATUS,
       C.FIRST_NAME,
       C.LAST_NAME

      FROM
      PUBLIC.STG_CUSTOMERS AS C
      JOIN (
      SELECT * from

      PUBLIC.STG_ORDERS

      ) AS O ON
      C.CUSTOMER_ID=O.CUSTOMER_ID
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}."CUSTOMER_ID" ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}."ORDER_ID" ;;
  }

  dimension: order_status {
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

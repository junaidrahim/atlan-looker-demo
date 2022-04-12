
include: "/models/**/*.model"
include: "/views/**/*.view"


view: order_details_derived_columns {
    derived_table: {
      explore_source: order_details {
        column: order_status {}
        column: count {}
        derived_column: derived_order_status {
          sql: ${orders.SQL_TABLE_NAME}.order_status = "returned";;
        }
      }
    }
    dimension: order_status {
      description: "order status "
    }
    dimension: count {
      description: ""
      type: number
    }
    dimension: derived_order_status {
      description: "derived_order_status"
    }
  }

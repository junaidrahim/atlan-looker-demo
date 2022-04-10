# include: "atlan_looker_demo.model.lkml"

# view: order_detail_extended {
#   derived_table: {
#     explore_source: order_details {
#       column: order_status {}
#       column: count {}
#     }
#   }
#   dimension: order_status {
#     description: "order status "
#   }
#   dimension: count {
#     description: ""
#     type: number
#   }
# }

























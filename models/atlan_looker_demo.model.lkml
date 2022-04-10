# Define the database connection to be used for this model.
connection: "snowflake_sudh_test"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: atlan_looker_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: atlan_looker_demo_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Atlan Looker Demo"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: customers {}

explore: my_first_dbt_model {}

explore: my_second_dbt_model {}

explore: oo {}

explore: oo_x {}

explore: orders {}

explore: raw_customers {}

explore: raw_orders {}

explore: raw_payments {}

explore: stg_customers {
  view_label: "Staging Customers"

}

explore: stg_orders {}

explore: stg_orders_secure {}

explore: stg_payments {}

explore: order_details {
  view_label: "Order Details"
  description: "Order details coming from derived table view"
  from: customer_order_details
}
explore: order_detail_extended {
  view_label: "Extended Explore from another explore -  Order Details"
  description: "Extened from another explore (derived table view)"
  from: order_detail_extended
  view_name: order_detail_extended
}


explore: joined_stg_customer {
  description: "Underlying view name and explore name is different in lookml file, actual views names are stg_customers and stg_orders"
  view_label: "Customers Orders"
  from: stg_customers

  join: stg_orders {
    view_label: "Stg Orders"
    relationship: one_to_many
    sql_on: ${stg_orders.customer_id}=${joined_stg_customer.customer_id} ;;
  }

}

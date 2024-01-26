# The name of this view in Looker is "Active Users"
view: active_users {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `winter-agility-390415.Refusal_Reason_Lux.Active Users` ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "New Existing" in Explore.

  dimension: new_existing {
    type: string
    sql: ${TABLE}.New_Existing ;;
  }

  dimension: prospect_customer {
    type: string
    sql: ${TABLE}.Prospect_Customer ;;
  }

  dimension: tier {
    type: string
    sql: CONCAT("Tier ",${TABLE}.Tier) ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.


  measure: active_users_ {
    type: count_distinct
    hidden: yes
    sql:id;;
  }

  measure: active_users {
    type: number
    sql: CASE WHEN sum(${active_users_}) IS NULL THEN 0 ELSE sum(${active_users_}) END;;
  }


}

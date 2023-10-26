# The name of this view in Looker is "Task Status"
view: task_status {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `winter-agility-390415.Refusal_Reason_Lux.Task_Status` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Call Feedback" in Explore.

  dimension: call_feedback {
    type: string
    sql: ${TABLE}.Call_Feedback ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.Customer_id ;;
  }

  dimension: refusal_reason {
    type: string
    sql: ${TABLE}.Refusal_Reason ;;
  }

  dimension: task_status {
    type: string
    sql: ${TABLE}.Task_Status ;;
  }
  measure: count {
    type: count_distinct
    sql: ${TABLE}.Customer_id;;
  }
}

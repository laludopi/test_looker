# The name of this view in Looker is "HTML"
view: html {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `winter-agility-390415.Refusal_Reason_Lux.HTML` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "HTML" in Explore.

  dimension: html {
    type: string
    sql: ${TABLE}.HTML ;;
    html: <img src='{{value}}' width='10%'> ;;
  }
  measure: count {
    type: count
  }
}

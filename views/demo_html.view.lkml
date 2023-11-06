# The name of this view in Looker is "Demo HTML"
view: demo_html {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `winter-agility-390415.demo_html.demo_html` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cost of Goods" in Explore.

  dimension: cost_of_goods {
    type: number
    sql: ${TABLE}.Cost_of_Goods ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cost_of_goods {
    type: sum
    sql: ${cost_of_goods} ;;  }
  measure: average_cost_of_goods {
    type: average
    sql: ${cost_of_goods} ;;  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
  }

  dimension: deprecation {
    type: number
    sql: ${TABLE}.Deprecation ;;
  }

  dimension: ebt {
    type: number
    sql: ${TABLE}.EBT ;;
  }

  dimension: gross_profit {
    type: number
    sql: ${TABLE}.Gross_Profit ;;
  }

  dimension: gross_profit__ {
    type: number
    sql: ${TABLE}.Gross_Profit__ ;;
  }

  dimension: interest {
    type: number
    sql: ${TABLE}.Interest ;;
  }

  dimension: interpretation {
    type: string
    sql: ${TABLE}.Interpretation ;;
  }

  dimension: net_earning {
    type: number
    sql: ${TABLE}.Net_Earning ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }

  dimension: rent {
    type: number
    sql: ${TABLE}.Rent ;;
  }

  dimension: revenues {
    type: number
    sql: ${TABLE}.Revenues ;;
  }

  dimension: salaries {
    type: number
    sql: ${TABLE}.Salaries ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}.Site ;;
  }

  dimension: taxes {
    type: number
    sql: ${TABLE}.Taxes ;;
  }
  measure: count {
    type: count
  }
}

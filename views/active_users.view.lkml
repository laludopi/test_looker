# The name of this view in Looker is "active_users"
view: active_users {
  derived_table: {
  datagroup_trigger: test_refusal_lux_default_datagroup
  sql:
  SELECT
  id, New_Existing,Prospect_Customer,Tier
  FROM  `winter-agility-390415.Refusal_Reason_Lux.Active Users`;;
  }


  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }
  dimension: new_existing {
    type: string
    sql: ${TABLE}.New_Existing ;;
  }

  dimension: prospect_customer {
    type: string
    sql: ${TABLE}.Prospect_Customer ;;
  }

  dimension: tier_id {
    type: number
    sql: ${TABLE}.Tier ;;
  }


  dimension: tier {
    type: string
    order_by_field: tier_id
    sql: CASE WHEN ${TABLE}.Tier=1 THEN "Silver"
    WHEN ${TABLE}.Tier=2 THEN "Gold"
    WHEN ${TABLE}.Tier=3 THEN "Platinum"
    ELSE "Diamond"END;;
  }

  measure: active_users_ {
    type: count_distinct
    hidden: yes
    sql:id;;
  }

  measure: active_users {
    type: number
    sql: CASE WHEN COUNT(DISTINCT ${id}) IS NULL THEN 0 ELSE COUNT(DISTINCT ${id}) END;;
  }


}

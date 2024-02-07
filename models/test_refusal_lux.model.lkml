# Define the database connection to be used for this model.
connection: "test_refusal_lux"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: test_refusal_lux_default_datagroup {
  sql_trigger: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24));;
  max_cache_age: "1 hour"
}

persist_with: test_refusal_lux_default_datagroup

explore: task_status {}

explore: demo_html {}

explore: html {}

explore: active_users{}

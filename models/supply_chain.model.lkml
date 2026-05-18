connection: "training_db"

include: "views/*view.lkml"
include: "explores/*explore.lkml"

datagroup: daily_refresh {
  sql_trigger: SELECT CURRENT_DATE ;;
}

persistent_with: daily_refresh {
  datagroup_trigger: daily_refresh
}






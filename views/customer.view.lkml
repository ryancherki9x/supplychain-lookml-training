view: customer {

  sql_table_name: analytic_customer ;;

  dimension: customer_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.customer_id ;;
  }
  dimension: customer_name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: customer_segment {
    type: string
    sql: ${TABLE}.segment ;;
  }
}



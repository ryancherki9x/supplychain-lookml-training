view: booking {

  sql_table_name: analytic_booking ;;

  dimension: booking_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: booking_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.booking_date ;;
  }
  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  measure: total_bookings {
    type: count
    sql: ${TABLE}.id ;;
  }


  measure: total_revenue {
    type: sum
    sql: ${TABLE}.revenue ;;
    value_format: "#,##0.00"
  }
}
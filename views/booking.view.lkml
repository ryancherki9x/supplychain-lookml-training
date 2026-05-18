view: booking {
  sql_table_name: analytic_booking ;;

  label: "Booking"
  description: "This view represents the booking data for analysis."

  dimension: booking_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    label: "Booking ID"
  }

  dimension_group: booking_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.booking_date ;;
    label: "Booking Date"
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
    label: "Customer ID"
  }

  measure: total_bookings {
    type: count
    label: "Total Bookings"
  }

  measure: total_revenue {
    type: sum
    sql: ${TABLE}.revenue ;;
    value_format_name: "usd"
    label: "Total Revenue"
  }
}
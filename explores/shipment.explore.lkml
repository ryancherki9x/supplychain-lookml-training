explore: booking {
  join: customer {
    type: left_outer
    sql_on: ${booking.customer_id} = ${customer.customer_id} ;;
    relationship: many_to_one
    }
    
  measure:avg_booking_value {
    type: average
    sql: ${booking.total_revenue} / NULLIF(${booking.total_bookings}, 0) ;;
    value_format: "#,##0.00"
  }
  measure: high_value_booking_pct {}
    type: number
    sql: SUM(CASE WHEN ${avg_booking_value} > 5000 THEN 1 ELSE 0 END)/ COUNT(*) ;;
    value_format: "0,0%"
}
  # You can add joins here if needed
  # join: other_view {
  #   sql_on: ${booking.booking_id} = ${other_view.booking_id} ;;
  # }

  # You can also add additional dimensions or measures specific to this explore
  # }
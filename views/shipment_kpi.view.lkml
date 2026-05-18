view: shipment_kpi {
  derived_table: {
    sql: 
      SELECT
        route_id,
        count(*) as shipment_count,
        avg(delay_days) as avg_delay_days,
        sum(revenue) as total_revenue,
      FROM analytic_booking
      GROUP BY route_id ;;
  }

  dimension: route_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.route_id ;;
  }

  measure: shipment_count {
    type: count
    sql: ${TABLE}.shipment_count ;;
  }

  measure: avg_delay_days {
    type: average
    sql: ${TABLE}.avg_delay_days ;;
    value_format: "#,##0.00"
  }
}

parameter: metric_selector {
  type: unquoted
  allowed_value: {
    label: "Revenue"
    value: "revenue"
  }
  allowed_value: {
    label: "Bookings"
    value: "booking"
  }
}
measure: dynamic_metric {
  type: number
  sql: CASE
    WHEN {% parameter metric_selector %} = "revenue" THEN ${total_revenue}
    ELSE ${total_bookings}
  END ;;
  value_format: "#,##0.00"
}







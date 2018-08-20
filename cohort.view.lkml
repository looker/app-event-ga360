include: "date_base.view"
include: "period_base.view"


view: cohort {
  extends: [date_base, period_base]
  derived_table: {
    explore_source: ga_sessions {
      column: _date { field: ga_sessions.visitStart_date }
      column: weeks_active { field: user_session_facts.weeks_active }
      column: first_start_date { field: user_session_facts.first_start_date }
      column: sessions { field: ga_sessions.total_visitors }
      column: bounces { field: totals.bounces_total }
      column: hits { field: totals.hits_total }
      column: page_views { field: totals.pageviews_total }
      column: time_on_site { field: totals.timeonsite_total }
      column: transactions { field: totals.transactions_count }
      column: transaction_revenue { field: totals.transactionRevenue_total }
      column: returning_users { field: ga_sessions.returning_visitors }
      bind_filters: {
        from_field: cohort.period
        to_field: ga_sessions.period
      }
      filters: {
        field: ga_sessions.date_period_latest
        value: "Yes"
      }
    }
  }

  dimension: weeks_active {
    type: number
  }

  dimension: first_date {
    hidden: yes
    type: date
    convert_tz: no
    sql: TIMESTAMP(${TABLE}.first_start_date);;
  }

  dimension: first_start_week {
    type: date_week
    convert_tz: no
    sql: ${TABLE}.first_start_date ;;
    can_filter: no
  }

  dimension: sessions {
    sql:  ${TABLE}.sessions ;;
    value_format_name: decimal_0
    hidden:  yes
  }

  dimension: bounces {
    sql:  ${TABLE}.bounces ;;
    value_format_name: decimal_0
    hidden:  yes
  }

  dimension: hits {
    sql: ${TABLE}.hits ;;
    hidden:  yes
  }

  dimension: pageviews {
    sql: ${TABLE}.page_views ;;
    value_format_name: decimal_0
    hidden:  yes
  }

  dimension: returning_users {
    sql: ${TABLE}.returning_users ;;
    hidden:  yes
  }

  dimension: pageviews_total {
    sql: ${TABLE}.page_views_total ;;
  }

  dimension: timeonsite {
    label: "Time On Site Total"
    sql: ${TABLE}.time_on_site ;;
    hidden:  yes
  }

  measure: transactions {
    hidden:  yes
    type: sum
    sql: ${TABLE}.transactions ;;
    value_format_name: decimal_0
  }

  dimension: transaction_revenue {
    hidden:  yes
    type: number
    sql: ${TABLE}.transaction_revenue ;;
    value_format_name: usd
  }

  parameter: measure_picker {
    type: string
    allowed_value: { value: "Sessions" }
    allowed_value: { value: "Bounces" }
    allowed_value: { value: "Page Views" }
    allowed_value: { value: "Hits" }
    allowed_value: { value: "Revenue" }
    allowed_value: { value: "Returning Users" }
    default_value: "Sessions"
  }

  measure: selected_measure {
    type: sum
    sql: {% if measure_picker._parameter_value == "'Sessions'" %}${sessions}
      {% elsif measure_picker._parameter_value == "'Page Views'" %}${pageviews}
      {% elsif measure_picker._parameter_value == "'Bounces'" %}${bounces}
      {% elsif measure_picker._parameter_value == "'Hits'" %}${hits}
      {% elsif measure_picker._parameter_value == "'Revenue'" %}${transaction_revenue}
      {% elsif measure_picker._parameter_value == "'Returning Users'" %}${returning_users}
      {% endif %} ;;
    value_format_name: decimal_large
  }

  dimension: _date {
    hidden:  yes
  }
}

explore: cohort {
  hidden:  yes
  label: "Cohort + Retention"
  view_label: "Cohort + Retention"
}

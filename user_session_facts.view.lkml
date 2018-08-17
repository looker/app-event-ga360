include: "sessions.view"

view: user_session_facts {
  extends: [period_parameter]
  derived_table: {
    explore_source: ga_sessions {
      column: full_visitor_id { field: ga_sessions.fullVisitorId }
      column: first_start_date { field: ga_sessions.visitStartSeconds_min }
      column: latest_start_date { field: ga_sessions.visitStartSeconds_max }
      column: days_active {}
      column: weeks_active {}
      column: days_since_first_session {}
      column: lifetime_sessions { field: ga_sessions.total_visitors }
      column: lifetime_transaction_revenue { field: totals.transactionRevenue_total }
      column: lifetime_transaction_count { field: totals.transactions_count }
      bind_filters: {
        from_field: ga_sessions.period
        to_field: ga_sessions.period
      }
      filters: {
        field: ga_sessions.date_period_latest
        value: "Yes"
      }
    }
  }

  dimension: full_visitor_id {
    hidden: yes
    primary_key: yes
    type: string
  }

  dimension_group: first_start {
    type: time
    sql: ${TABLE}.first_start_date ;;
    timeframes: [date, week, month]
    convert_tz: no
  }

  dimension_group: latest_start_date {
    type: time
    sql: ${TABLE}.latest_start_date ;;
    hidden: yes
    convert_tz: no
  }

  dimension: days_active {
    type: number
  }

  dimension: weeks_active {
    type: number
  }

  dimension: days_since_first_session {
    type: number
  }

  dimension: lifetime_sessions {
    type: number
  }

  dimension: lifetime_transaction_revenue {
    type: number
    hidden: yes
  }

  dimension: lifetime_transaction_count {
    type: number
  }

  dimension: lifetime_transaction_revenue_tier {
    type: tier
    sql: ${TABLE}.lifetime_transaction_revenue ;;
    tiers: [0,1,5,10,25,50,100,150,200,250]
    style: integer
    value_format_name: usd_0
  }

  set: detail {
    fields: [
      latest_start_date_time,
      lifetime_sessions,
      days_active,
      days_since_first_session
    ]
  }
}

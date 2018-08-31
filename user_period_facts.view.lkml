include: "sessions.view"

explore: user_period_facts {
  join: last {
    from: user_period_facts
    sql_on:
      ${user_period_facts.date_last_period} = ${last.date_period}
      AND ${user_period_facts.full_visitor_id} = ${last.full_visitor_id} ;;
    relationship: one_to_one
  }
}

view: user_period_facts {
  extends: [period_parameter]
  derived_table: {
    explore_source: ga_sessions {
      column: full_visitor_id { field: ga_sessions.fullVisitorId }
      column: date_period { field: ga_sesssions.date_period }
      column: date_last_period { field: ga_sesssions.date_last_period }
      column: first_period { field: ga_sessions.min_date_period }
      column: days_active {}
      column: weeks_active {}
      column: total_visitors { field: ga_sessions.total_visitors }
      column: transactionRevenue_total { field: totals.transactionRevenue_total }
      column: transactions_count { field: totals.transactions_count }
      bind_filters: {
        from_field: user_session_facts.period
        to_field: ga_sessions.period
      }
    }
  }

  dimension: full_visitor_id {
    hidden: yes
    primary_key: yes
    type: string
  }

  dimension: date_period {
    type: date
    convert_tz: no
    sql: ${TABLE}.date_period ;;
  }

  dimension: date_last_period {
    type: date
    convert_tz: no
    sql: ${TABLE}.date_last_period ;;
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
      date_period,
      lifetime_sessions,
      days_active,
      days_since_first_session
    ]
  }
}

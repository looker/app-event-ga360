include: "date_base.view"
include: "period_base.view"

explore: period_fact {
  hidden: yes
  label: "This Period"
  view_label: "This Period"
  join: last_fact {
    from: period_fact
    view_label: "Prior Period"
    sql_on:
      ${period_fact.date_last_period} = ${last_fact.date_period}
      AND ${period_fact.date_day_of_period} = ${last_fact.date_day_of_period}
      AND ${period_fact.channel_grouping} = ${last_fact.channel_grouping}
      AND ${period_fact.social_engagement_type} = ${last_fact.social_engagement_type}
      AND ${period_fact.campaign} =  ${last_fact.campaign}
      AND ${period_fact.country} = ${last_fact.country} ;;
    relationship: one_to_one
  }
}

view: period_fact {
  extends: [date_base, period_fact_period_base]
  derived_table: {
    explore_source: ga_sessions {
      column: channel_grouping { field: ga_sessions.channelGrouping }
      column: social_engagement_type { field: ga_sessions.socialEngagementType }
      column: campaign { field: trafficSource.campaign }
      column: country { field: geoNetwork.country }
      column: _date { field: ga_sessions.visitStart_date }
      column: session_count { field: ga_sessions.total_visitors }
      column: visits { field: totals.visits_total }
      column: transaction_revenue { field: totals.transactionRevenue_total }
      column: first_time_visitors {}
      column: returning_visitors {}
      column: unique_visitors {}
      column: bounces { field: totals.bounces_total }
      column: hits { field: totals.hits_total }
      column: page_views { field: totals.pageviews_total }
      column: time_on_screen { field: totals.timeOnScreen_total }
      column: time_on_site { field: totals.timeonsite_total }
      column: transactions { field: totals.transactions_count }
      column: screenviews { field: totals.screenViews_total }

      bind_filters: {
        from_field: period_fact.period
        to_field: ga_sessions.period
      }
      filters: {
        field: ga_sessions.date_period_comparison_period
        value: "Yes"
      }
    }
  }
  dimension: social_engagement_type {}
  dimension: channel_grouping {}
  dimension: campaign {}
  dimension: country {}

  dimension: id {
    type: string
    primary_key: yes
    sql: CONCAT(
      CAST(${channel_grouping} AS STRING), '|',
      CAST(${social_engagement_type} AS STRING), '|',
      CAST(${_date} AS STRING), '|',
      CAST(${country} AS STRING), '|',
      CAST(${campaign} AS STRING)
    );;
  }

  dimension: _date {
    hidden: yes
    type: date_raw
  }

  measure: session_count {
    type: sum
    sql: ${TABLE}.session_count ;;
    value_format_name: decimal_large
  }

  measure: total_visits {
    type: sum
    sql: ${TABLE}.visits ;;
    value_format_name: decimal_large
  }

  measure: transaction_revenue_total {
    type: sum
    sql: ${TABLE}.transaction_revenue ;;
    value_format_name: usd_large
  }

  measure: revenue_per_transaction {
    type: number
    sql: ${transaction_revenue_total} / NULLIF(${total_transactions}, 0);;
    value_format_name: usd
  }

  measure: converions_rate {
    type: number
    sql:  ${total_transactions} / NULLIF(${session_count}, 0) ;;
    value_format_name: decimal_1
  }

  measure: new_visits {
    type: sum
    sql: ${TABLE}.new_visits ;;
    value_format_name: decimal_0
  }

  measure: total_transactions {
    type: sum
    sql: ${TABLE}.transactions ;;
    value_format_name: decimal_large
  }

  measure: hits {
    type: sum
    sql: ${TABLE}.hits ;;
    value_format_name: decimal_large
  }

  measure: totals_screenviews {
    type: sum
    sql: ${TABLE}.totals_screenviews ;;
    value_format_name: decimal_large
  }

  measure: first_time_visitors {
    type: sum
    sql: ${TABLE}.first_time_visitors ;;
    value_format_name: decimal_large
  }

  measure: returning_visitors {
    type: sum
    sql: ${TABLE}.returning_visitors ;;
    value_format_name: decimal_large
  }

  measure: unique_visitors {
    type: sum
    sql: ${TABLE}.unique_visitors ;;
    value_format_name: decimal_large
  }

  measure: total_visitors {
    type: sum
    sql: ${TABLE}.total_visitors ;;
    value_format_name: decimal_large
  }

  measure: bounces {
    type: sum
    sql: ${TABLE}.bounces ;;
    value_format_name: decimal_large
  }

  measure: bounce_rate {
    type: number
    sql: ${bounces} / NULLIF(${session_count}, 0);;
    value_format_name: percent_2
  }

  measure: total_page_views {
    type: sum
    sql: ${TABLE}.page_views ;;
    value_format_name: decimal_large
  }

  measure: total_time_on_screen{
    type: sum
    sql: ${TABLE}.time_on_screen ;;
  }

  measure: total_time_on_site{
    type: sum
    sql: ${TABLE}.time_on_site ;;
  }

  measure: hits_average_per_session {
    type: number
    sql: ${hits}/NULLIF(${session_count},0) ;;
    value_format_name: decimal_1
  }

  measure: page_views_per_session {
    type: number
    sql: ${total_page_views}/NULLIF(${session_count}, 0) ;;
    value_format_name: decimal_2
  }

  measure: avg_sessions_per_visitor {
    type: number
    sql: ${session_count}/NULLIF(${unique_visitors}, 0) ;;
    value_format_name: decimal_2
  }

  measure: average_page_views_per_user {
    type: number
    sql: ${total_page_views}/NULLIF(${unique_visitors}, 0) ;;
    value_format_name: decimal_1
  }

  measure: time_on_site_average_per_session {
    type: number
    sql: ${total_time_on_site}/NULLIF(${session_count}, 0) ;;
    value_format_name: decimal_1
  }
}

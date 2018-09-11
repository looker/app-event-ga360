include: "sessions.view"
include: "date_base.view"

view: peer_comparison {
  extends: [period_parameter, date_base]
  derived_table: {
    explore_source: ga_sessions {
      column: brand { field: hits_product.productBrand }
      column: page_title { field: hits_page.pageTitle }
      column: product_category { field: hits_product.v2ProductCategory }
      column: product_name { field: hits_product.v2ProductName }
      column: campaign { field: trafficSource.campaign }
      column: date_date {}
      column: unique_visitors {}
      column: bounces_total { field: totals.bounces_total }
      column: session_count {}
      column: visits_total { field: totals.visits_total }
      column: transactions_count { field: totals.transactions_count }
      column: transactionRevenue_total { field: totals.transactionRevenue_total }
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


  filter: category_select {
    suggest_dimension: hits_product.v2ProductCategory
    suggest_explore: ga_sessions
  }

  filter: brand_select {
    suggest_dimension: hits_product.productBrand
    suggest_explore: ga_sessions
  }

  filter: page_select {
    suggest_dimension: hits_page.pageTitle
    suggest_explore: ga_sessions
  }

  dimension: pagePath {
    label: "Page Path"
  }

  dimension: _date {
    hidden: yes
    type: date_raw
  }

  dimension: date_end_of_period {
    hidden:  yes
  }

  dimension: date_last_period {
    hidden:  yes
  }

  dimension: id {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${brand}, "|", ${page_title}, "|", ${_date}, "|", ${campaign}, "|", ${product_category}, "|", ${product_name}) ;;
  }

  dimension: brand {
    full_suggestions: yes
  }

  dimension: page_title {
    full_suggestions: yes
  }

  dimension: campaign {
    full_suggestions: yes
  }

  dimension: product_category {
    full_suggestions: yes
  }

  dimension: product_name {
    full_suggestions: yes
  }

  dimension: brand_comparitor {
  sql: CASE
        WHEN {% condition brand_select %} ${brand} {% endcondition %}
        THEN ${brand}
      ELSE 'Rest of Population'
    END ;;

  }

  dimension: category_comparitor {
    sql: CASE
        WHEN {% condition category_select %} ${product_category} {% endcondition %}
        THEN ${product_category}
      ELSE 'Rest of Population'
    END ;;
    }

  dimension: page_comparitor {
    sql: CASE
        WHEN {% condition page_select %} ${page_title} {% endcondition %}
        THEN ${page_title}
      ELSE 'Rest of Population'
    END ;;
  }

  measure: sessions {
    type: sum
    sql: ${TABLE}.session_count ;;
    value_format_name: decimal_0
  }

  measure: sessions_percent_of_total {
    type: percent_of_total
    sql: ${sessions} ;;
  }

  measure: revenue {
    type: sum
    sql: ${TABLE}.transaction_revenue ;;
    value_format_name: usd_large
  }

  measure: revenue_percent_of_total {
    type: percent_of_total
    sql: ${revenue} ;;
  }

  measure: converions_rate {
    type: number
    sql:  ${total_transactions} / NULLIF(${sessions}, 0) ;;
    value_format_name: decimal_1
  }

  measure: total_transactions {
    type: sum
    sql: ${TABLE}.transactions ;;
    value_format_name: decimal_0
  }

  measure: unique_visitors {
    type: sum
    sql: ${TABLE}.unique_visitors ;;
    value_format_name: decimal_0
  }

  measure: bounces {
    type: sum
    sql: ${TABLE}.bounces ;;
    value_format_name: decimal_0
  }

  measure: bounces_percent_of_total {
    type: percent_of_total
    sql: ${bounces} ;;
  }

}

explore: peer_comparison {
  hidden: no
  from: peer_comparison
  view_name: ga_sessions
  label: "Peer Comparison"
  view_label: "Peer Comparison"
  }

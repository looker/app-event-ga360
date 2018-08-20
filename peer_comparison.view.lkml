# include: "date_base.view"
# include: "sessions.view"
# include: "period_base.view"
# include: "/app_event_analytics_config/ga360_config.view"

# view: peer_comparison {
#   extends: [date_base, period_base, ga360_config]
#   derived_table: {
#     sql:
#       SELECT
#         CONCAT(CAST(hits_product.productBrand AS STRING), '|', CAST(hits_page.pageTitle AS STRING), '|', CAST(PARSE_DATE('%Y%m%d', date) AS STRING), '|', CAST(trafficSource.campaign AS STRING), '|', CAST(hits_product.v2ProductCategory AS STRING), '|', CAST(hits_product.v2ProductName AS STRING)) AS id,
#         hits_product.productBrand AS brand,
#         hits_page.pageTitle AS page_title,
#         hits_product.v2ProductCategory AS product_category,
#         hits_product.v2ProductName AS product_name,
#         trafficSource.campaign AS campaign,
#         PARSE_DATE('%Y%m%d', date) AS _date,
#         COUNT(DISTINCT ga_sessions.fullVisitorId ) AS unique_visitors,
#         1.0 * (COALESCE(SUM(totals.bounces ), 0))  AS bounces,
#         COUNT(*) AS session_count,
#         COALESCE(SUM(totals.visits ), 0) AS visits,
#         COALESCE(SUM(totals.transactions ), 0) AS transactions,
#         COALESCE(SUM((totals.transactionRevenue/1000000) ), 0) AS transaction_revenue
#       FROM {{ ga_sessions.ga_sample_schema._sql }} AS ga_sessions
#       LEFT JOIN UNNEST([ga_sessions.totals]) as totals
#       LEFT JOIN UNNEST([ga_sessions.trafficSource]) as trafficSource
#       LEFT JOIN UNNEST(ga_sessions.hits) as hits
#       LEFT JOIN UNNEST([hits.page]) as hits_page
#       LEFT JOIN UNNEST([hits.eventInfo]) as hits_eventInfo
#       LEFT JOIN UNNEST(hits.product) as  hits_product
#       GROUP BY 1,2,3,4,5,6,7;;
#       persist_for: "24 hours"
#     }

#   filter: category_select {
#     suggest_dimension: hits_product.v2ProductCategory
#     suggest_explore: ga_sessions
#   }

#   filter: brand_select {
#     suggest_dimension: hits_product.productBrand
#     suggest_explore: ga_sessions
#   }

#   filter: page_select {
#     suggest_dimension: hits_page.pageTitle
#     suggest_explore: ga_sessions
#   }

#   dimension: pagePath {
#     label: "Page Path"
#   }


#   dimension: date_period_comparison_period {
# #     hidden: yes
#     description: "Is the selected period (This Period) in the last two periods?"
#     type: yesno
#     group_label: "Event"
#     sql: ${date_period} >= {% if ga_sessions.period._parameter_value contains "day" %}
#         {% if ga_sessions.period._parameter_value == "'7 day'" %}DATE_ADD(CURRENT_DATE(), INTERVAL -2*7 DAY)
#         {% elsif ga_sessions.period._parameter_value == "'28 day'" %}DATE_ADD(CURRENT_DATE(), INTERVAL -2*28 DAY)
#         {% elsif ga_sessions.period._parameter_value == "'91 day'" %}DATE_ADD(CURRENT_DATE(), INTERVAL -2*91 DAY)
#         {% elsif ga_sessions.period._parameter_value == "'364 day'" %}DATE_ADD(CURRENT_DATE(), INTERVAL -2*364 DAY)
#         {% else %}${date_date}
#         {% endif %}
#       {% elsif ga_sessions.period._parameter_value contains "week" %}DATE_ADD(CURRENT_DATE(), INTERVAL -2 WEEK)
#       {% elsif ga_sessions.period._parameter_value contains "month" %}DATE_ADD(CURRENT_DATE(), INTERVAL -2 MONTH)
#       {% elsif ga_sessions.period._parameter_value contains "quarter" %}DATE_ADD(CURRENT_DATE(), INTERVAL -2 QUARTER)
#       {% elsif ga_sessions.period._parameter_value contains "year" %}DATE_ADD(CURRENT_DATE(), INTERVAL -2 YEAR)
#       {% endif %} ;;
#   }


#   dimension: _date {
#     hidden: yes
#     type: date_raw
#   }

#   dimension: date_end_of_period {
#     hidden:  yes
#   }

#   dimension: date_last_period {
#     hidden:  yes
#   }

#   dimension: id {
#     primary_key: yes
#     hidden: yes
#   }
#   dimension: brand {
#     full_suggestions: yes
#   }

#   dimension: page_title {
#     full_suggestions: yes
#   }

#   dimension: campaign {}

#   dimension: product_category {
#     full_suggestions: yes
#   }

#   dimension: product_name {
#     full_suggestions: yes
#   }

#   dimension: brand_comparitor {
#   sql: CASE
#         WHEN {% condition brand_select %} ${brand} {% endcondition %}
#         THEN ${brand}
#       ELSE 'Rest of Population'
#     END ;;

#   }

#   dimension: category_comparitor {
#     sql: CASE
#         WHEN {% condition category_select %} ${product_category} {% endcondition %}
#         THEN ${product_category}
#       ELSE 'Rest of Population'
#     END ;;
#     }

#   dimension: page_comparitor {
#     sql: CASE
#         WHEN {% condition category_select %} ${page_title} {% endcondition %}
#         THEN ${page_title}
#       ELSE 'Rest of Population'
#     END ;;
#   }

#   measure: sessions {
#     type: sum
#     sql: ${TABLE}.session_count ;;
#     value_format_name: decimal_0
#   }

#   measure: sessions_percent_of_total {
#     type: percent_of_total
#     sql: ${sessions} ;;
#   }

#   measure: revenue {
#     type: sum
#     sql: ${TABLE}.transaction_revenue ;;
#     value_format_name: usd_large
#   }

#   measure: revenue_percent_of_total {
#     type: percent_of_total
#     sql: ${revenue} ;;
#   }

#   measure: converions_rate {
#     type: number
#     sql:  ${total_transactions} / NULLIF(${sessions}, 0) ;;
#     value_format_name: decimal_1
#   }

#   measure: total_transactions {
#     type: sum
#     sql: ${TABLE}.transactions ;;
#     value_format_name: decimal_0
#   }

#   measure: unique_visitors {
#     type: sum
#     sql: ${TABLE}.unique_visitors ;;
#     value_format_name: decimal_0
#   }

#   measure: bounces {
#     type: sum
#     sql: ${TABLE}.bounces ;;
#     value_format_name: decimal_0
#   }

#   measure: bounces_percent_of_total {
#     type: percent_of_total
#     sql: ${bounces} ;;
#   }

# }

# explore: peer_comparison {
#   hidden: yes
#   from: peer_comparison
#   view_name: ga_sessions
#   label: "Peer Comparison"
#   view_label: "Peer Comparison"
#   }

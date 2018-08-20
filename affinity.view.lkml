# include: "date_base.view"
# include: "period_base.view"
# include: "/app_event_analytics_config/ga360_config.view"


# view: affinity {
#   extends: [date_base, period_base, ga360_config]
#   derived_table: {
#     sql:
#       WITH purchased_a as (
#         SELECT
#           ga_sessions.fullVisitorId,
#           hits_product.v2ProductName as product_a,
#           COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(totals.transactions ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST((CONCAT(CAST(ga_sessions.fullVisitorId AS STRING),
#           '|', COALESCE(CAST(ga_sessions.visitId AS STRING),'')))  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST((CONCAT(CAST(ga_sessions.fullVisitorId AS STRING), '|',
#           COALESCE(CAST(ga_sessions.visitId AS STRING),'')))  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST((CONCAT(CAST(ga_sessions.fullVisitorId AS STRING),
#           '|', COALESCE(CAST(ga_sessions.visitId AS STRING),'')))  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST((CONCAT(CAST(ga_sessions.fullVisitorId AS STRING), '|',
#           COALESCE(CAST(ga_sessions.visitId AS STRING),'')))  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0) AS transactions_count
#         FROM {{ ga_sessions.ga_sample_schema._sql }}  AS ga_sessions
#         LEFT JOIN UNNEST([ga_sessions.totals]) as totals
#         LEFT JOIN UNNEST(ga_sessions.hits) as hits
#         LEFT JOIN UNNEST(hits.product) as  hits_product
#         WHERE
#           {% condition ga_sessions.product_a_filter %} hits_product.v2ProductName {% endcondition %}
#         GROUP BY 1,2
#         HAVING (COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(totals.transactions ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST((CONCAT(CAST(ga_sessions.fullVisitorId AS STRING),
#         '|', COALESCE(CAST(ga_sessions.visitId AS STRING),'')))  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST((CONCAT(CAST(ga_sessions.fullVisitorId AS STRING), '|',
#         COALESCE(CAST(ga_sessions.visitId AS STRING),'')))  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST((CONCAT(CAST(ga_sessions.fullVisitorId AS STRING),
#         '|', COALESCE(CAST(ga_sessions.visitId AS STRING),'')))  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST((CONCAT(CAST(ga_sessions.fullVisitorId AS STRING), '|',
#         COALESCE(CAST(ga_sessions.visitId AS STRING),'')))  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0) > 1)
#       )

#       SELECT
#         ga_sessions.fullVisitorId as full_visitor_id,
#         hits_product.v2ProductName AS product_b,
#         purchased_a.product_a as product_a,
#         PARSE_DATE('%Y%m%d', date) AS _date,
#         SUM(purchased_a.transactions_count) as a_transactions_count,
#         COUNT(hits_product.v2ProductName) AS quantity,
#         COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(totals.transactions ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST((CONCAT(CAST(ga_sessions.fullVisitorId AS STRING), '|',
#         COALESCE(CAST(ga_sessions.visitId AS STRING),'')))  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST((CONCAT(CAST(ga_sessions.fullVisitorId AS STRING), '|',
#         COALESCE(CAST(ga_sessions.visitId AS STRING),'')))  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST((CONCAT(CAST(ga_sessions.fullVisitorId AS STRING),
#         '|', COALESCE(CAST(ga_sessions.visitId AS STRING),'')))  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST((CONCAT(CAST(ga_sessions.fullVisitorId AS STRING),
#         '|', COALESCE(CAST(ga_sessions.visitId AS STRING),'')))  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0) AS b_transactions_count
#       FROM {{ ga_sessions.ga_sample_schema._sql }} AS ga_sessions
#       LEFT JOIN UNNEST([ga_sessions.totals]) as totals
#       LEFT JOIN UNNEST(ga_sessions.hits) as hits
#       LEFT JOIN UNNEST(hits.product) as  hits_product
#       JOIN purchased_a ON
#         ga_sessions.fullVisitorId = purchased_a.fullVisitorId
#       WHERE
#         hits_product.v2ProductName IS NOT NULL
#         AND hits_product.v2ProductName != purchased_a.product_a
#       GROUP BY 1,2,3,4;;
#   }

#   filter: product_a_filter {
#     label: "Product A"
#     type: string
#     suggest_dimension: hits_product.v2ProductName
#     suggest_explore: ga_sessions
#   }

#   dimension: id {
#     type: string
#     hidden:  yes
#     primary_key: yes
#     sql: CONCAT(${full_visitor_id}, '|', ${product_b}) ;;
#   }

#   dimension: full_visitor_id {}

#   dimension: product_b {}

#   dimension: product_a {}

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

#   measure: quantity_product_b {
#     type: sum
#     sql: ${TABLE}.quantity ;;
#     value_format_name: decimal_0
#   }

#   measure: product_a_transactions_count {
#     description: "How many times item A and B were purchased in the same order"
#     type: sum
#     sql: ${TABLE}.a_transactions_count ;;
#     value_format_name: decimal_0
#   }

#   measure: joint_transactions_count {
#     description: "Total number of orders with products A and B in them, during specified timeframe"
#     type: sum
#     sql: ${TABLE}.b_transactions_count ;;
#     value_format_name: decimal_0
#   }

# }

# explore: affinity {
#   hidden: yes
#   from: affinity
#   view_name: ga_sessions
#   label: "Affinity"
#   view_label: "Affinity"
# }

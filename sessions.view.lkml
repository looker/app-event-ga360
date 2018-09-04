include: "date_base.view"
include: "period_base.view"
include: "event_base.view"
include: "page_base.view"
include: "user_session_facts.view"

explore: ga_sessions_template {
  extends: [ga_sessions_block]
  extension: required

  join: user_session_facts {
    view_label: "User Session Fact"
    sql_on: ${user_session_facts.full_visitor_id} = ${ga_sessions.fullVisitorId} ;;
    relationship: many_to_one
  }
}

view: ga_sessions_template {
  extends: [ga_sessions_adapter, date_base, period_base, event_base, page_base]
  extension: required

  dimension: _date {
    hidden: yes
    sql: ${partition_date} ;;
  }
}

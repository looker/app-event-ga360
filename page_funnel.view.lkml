include: "sessions.view"
include: "funnel_base.view"

view: page_funnel {
  extends: [page_filters, funnel_base]
  derived_table: {
    explore_source: ga_sessions {
      column: date { field: ga_sessions.visitStart_date }
      column: visit_id { field: ga_sessions.visitId }
      column: full_visitor_id { field: ga_sessions.fullVisitorId }
      column: session_start { field: ga_sessions.visitStartSeconds }
      column: event_1 { field: ga_sessions.min_page_1_ts }
      column: event_2_first { field: ga_sessions.min_page_2_ts }
      column: event_2_last { field: ga_sessions.max_page_2_ts }
      column: event_3_first { field: ga_sessions.min_page_3_ts }
      column: event_3_last { field: ga_sessions.max_page_3_ts }
      column: event_4_first { field: ga_sessions.min_page_4_ts }
      column: event_4_last { field: ga_sessions.max_page_4_ts }

      bind_filters: {
        from_field: page_funnel.period
        to_field: ga_sessions.period
      }
      bind_filters: {
        from_field: page_funnel.page_1
        to_field: ga_sessions.page_1
      }
      bind_filters: {
        from_field: page_funnel.page_2
        to_field: ga_sessions.page_2
      }
      bind_filters: {
        from_field: page_funnel.page_3
        to_field: ga_sessions.page_3
      }
      bind_filters: {
        from_field: page_funnel.page_4
        to_field: ga_sessions.page_4
      }
      filters: {
        field: ga_sessions.date_period_latest
        value: "Yes"
      }
    }
  }
}

explore: page_funnel {
  hidden:  yes
  label: "Page Funnel"
  view_label: "Page Funnel"
}

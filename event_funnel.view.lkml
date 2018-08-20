include: "sessions.view"
include: "funnel_base.view"

view: event_funnel {
  extends: [event_filters, funnel_base]
  derived_table: {
    explore_source: ga_sessions {
      column: date { field: ga_sessions.visitStart_date }
      column: visit_id { field: ga_sessions.visitId }
      column: full_visitor_id { field: ga_sessions.fullVisitorId }
      column: session_start { field: ga_sessions.visitStartSeconds }
      column: event_1 { field: ga_sessions.min_event_1_ts }
      column: event_2_first { field: ga_sessions.min_event_2_ts }
      column: event_2_last { field: ga_sessions.max_event_2_ts }
      column: event_3_first { field: ga_sessions.min_event_3_ts }
      column: event_3_last { field: ga_sessions.max_event_3_ts }
      column: event_4_first { field: ga_sessions.min_event_4_ts }
      column: event_4_last { field: ga_sessions.max_event_4_ts }

      bind_filters: {
        from_field: event_funnel.period
        to_field: ga_sessions.period
      }
      bind_filters: {
        from_field: event_funnel.event_1_filter
        to_field: ga_sessions.event_1_filter
      }
      bind_filters: {
        from_field: event_funnel.event_2_filter
        to_field: ga_sessions.event_2_filter
      }
      bind_filters: {
        from_field: event_funnel.event_3_filter
        to_field: ga_sessions.event_3_filter
      }
      bind_filters: {
        from_field: event_funnel.event_4_filter
        to_field: ga_sessions.event_4_filter
      }
      filters: {
        field: ga_sessions.date_period_latest
        value: "Yes"
      }
    }
  }
}

explore: event_funnel {
  hidden:  yes
  label: "Event Funnel"
  view_label: "Event Funnel"
}

- dashboard: acquisition
  title: Acquisition
  extends: event_analytics_dash_base
  layout: newspaper
  embed_style:
    background_color: "#ffffff"
    title_color: "#3a4245"
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - name: Where and when should you acquire users?
    type: text
    title_text: Where and when should you acquire users?
    row: 9
    col: 0
    width: 24
    height: 2
  - name: How are search and social performing?
    type: text
    title_text: How are search and social performing?
    row: 36
    col: 0
    width: 24
    height: 2
  - title: Sessions
    name: Sessions
    model: event_analytics
    explore: ga_sessions
    type: single_value
    fields:
    - ga_sessions.date_period
    - ga_sessions.session_count
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - ga_sessions.returning_visitors
    - totals.transaction_conversion_rate
    - totals.bounce_rate
    sorts:
    - ga_sessions.date_period desc
    limit: 2
    column_limit: 50
    dynamic_fields:
    - table_calculation: sessions
      label: Sessions
      expression: "(${ga_sessions.session_count} - offset(${ga_sessions.session_count},\
        \ 1)) / offset(${ga_sessions.session_count}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: avg_duration
      label: Avg Duration
      expression: "(${totals.timeonsite_average_per_session} - offset(${totals.timeonsite_average_per_session},\
        \ 1)) / offset(${totals.timeonsite_average_per_session}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: users
      label: Users
      expression: "(${ga_sessions.unique_visitors} - offset(${ga_sessions.unique_visitors},\
        \ 1)) / offset(${ga_sessions.unique_visitors}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: returning_users
      label: Returning Users
      expression: "(${ga_sessions.returning_visitors} - offset(${ga_sessions.returning_visitors},\
        \ 1)) / offset(${ga_sessions.returning_visitors}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: conversion_rate
      label: Conversion Rate
      expression: "(${totals.transaction_conversion_rate} - offset(${totals.transaction_conversion_rate},\
        \ 1)) / offset(${totals.transaction_conversion_rate}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: bounce_rate
      label: Bounce Rate
      expression: "(${totals.bounce_rate} - offset(${totals.bounce_rate}, 1)) / offset(${totals.bounce_rate},\
        \ 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: circle_outline
    interpolation: monotone
    series_types: {}
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.unique_visitors
        name: Unique Visitors
        axisId: ga_sessions.unique_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 127
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 124
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Visitors
        axisId: ga_sessions.returning_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 143
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 140
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 159
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 156
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 175
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 172
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 191
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 188
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 206
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 203
    colors:
    - "#58A9F5"
    - "#B9E49A"
    - "#FDCB6C"
    - "#F6659A"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    series_colors: {}
    hidden_series:
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - totals.transaction_conversion_rate
    hidden_fields:
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - ga_sessions.returning_visitors
    - totals.transaction_conversion_rate
    - totals.bounce_rate
    - avg_duration
    - users
    - returning_users
    - conversion_rate
    - bounce_rate
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Host: ga_sessions.has_host
      Page: ga_sessions.has_page
      Goal Selection: ga_sessions.goal_selection
      Search Keyword: trafficSource.keyword
      Property: ga_sessions.property
      Comparison Period Latest: ga_sessions.date_period_comparison_period
    row: 0
    col: 0
    width: 4
    height: 2
  - title: Users
    name: Users
    model: event_analytics
    explore: ga_sessions
    type: single_value
    fields:
    - ga_sessions.date_period
    - ga_sessions.session_count
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - ga_sessions.returning_visitors
    - totals.transaction_conversion_rate
    - totals.bounce_rate
    sorts:
    - ga_sessions.date_period desc
    limit: 2
    column_limit: 50
    dynamic_fields:
    - table_calculation: sessions
      label: Sessions
      expression: "(${ga_sessions.session_count} - offset(${ga_sessions.session_count},\
        \ 1)) / offset(${ga_sessions.session_count}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: avg_duration
      label: Avg Duration
      expression: "(${totals.timeonsite_average_per_session} - offset(${totals.timeonsite_average_per_session},\
        \ 1)) / offset(${totals.timeonsite_average_per_session}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: users
      label: Users
      expression: "(${ga_sessions.unique_visitors} - offset(${ga_sessions.unique_visitors},\
        \ 1)) / offset(${ga_sessions.unique_visitors}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: returning_users
      label: Returning Users
      expression: "(${ga_sessions.returning_visitors} - offset(${ga_sessions.returning_visitors},\
        \ 1)) / offset(${ga_sessions.returning_visitors}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: conversion_rate
      label: Conversion Rate
      expression: "(${totals.transaction_conversion_rate} - offset(${totals.transaction_conversion_rate},\
        \ 1)) / offset(${totals.transaction_conversion_rate}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: bounce_rate
      label: Bounce Rate
      expression: "(${totals.bounce_rate} - offset(${totals.bounce_rate}, 1)) / offset(${totals.bounce_rate},\
        \ 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: circle_outline
    interpolation: monotone
    series_types: {}
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.unique_visitors
        name: Unique Visitors
        axisId: ga_sessions.unique_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 608
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 605
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Visitors
        axisId: ga_sessions.returning_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 624
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 621
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 640
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 637
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 656
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 653
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 672
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 669
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 687
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 684
    colors:
    - "#58A9F5"
    - "#B9E49A"
    - "#FDCB6C"
    - "#F6659A"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    series_colors: {}
    hidden_series:
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - totals.transaction_conversion_rate
    hidden_fields:
    - ga_sessions.returning_visitors
    - totals.transaction_conversion_rate
    - totals.bounce_rate
    - returning_users
    - conversion_rate
    - bounce_rate
    - ga_sessions.session_count
    - sessions
    - totals.timeonsite_average_per_session
    - avg_duration
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Host: ga_sessions.has_host
      Page: ga_sessions.has_page
      Goal Selection: ga_sessions.goal_selection
      Search Keyword: trafficSource.keyword
      Property: ga_sessions.property
      Comparison Period Latest: ga_sessions.date_period_comparison_period
    row: 0
    col: 4
    width: 3
    height: 2
  - title: New Users
    name: New Users
    model: event_analytics
    explore: ga_sessions
    type: single_value
    fields:
    - ga_sessions.date_period
    - ga_sessions.session_count
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - ga_sessions.returning_visitors
    - totals.transaction_conversion_rate
    - totals.bounce_rate
    - totals.newVisits_total
    sorts:
    - ga_sessions.date_period desc
    limit: 2
    column_limit: 50
    dynamic_fields:
    - table_calculation: sessions
      label: Sessions
      expression: "(${ga_sessions.session_count} - offset(${ga_sessions.session_count},\
        \ 1)) / offset(${ga_sessions.session_count}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: avg_duration
      label: Avg Duration
      expression: "(${totals.timeonsite_average_per_session} - offset(${totals.timeonsite_average_per_session},\
        \ 1)) / offset(${totals.timeonsite_average_per_session}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: users
      label: Users
      expression: "(${ga_sessions.unique_visitors} - offset(${ga_sessions.unique_visitors},\
        \ 1)) / offset(${ga_sessions.unique_visitors}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: returning_users
      label: Returning Users
      expression: "(${ga_sessions.returning_visitors} - offset(${ga_sessions.returning_visitors},\
        \ 1)) / offset(${ga_sessions.returning_visitors}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: conversion_rate
      label: Conversion Rate
      expression: "(${totals.transaction_conversion_rate} - offset(${totals.transaction_conversion_rate},\
        \ 1)) / offset(${totals.transaction_conversion_rate}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: bounce_rate
      label: Bounce Rate
      expression: "(${totals.bounce_rate} - offset(${totals.bounce_rate}, 1)) / offset(${totals.bounce_rate},\
        \ 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: new_visitors
      label: New Users
      expression: "(${totals.newVisits_total} - offset(${totals.newVisits_total},\
        \ 1)) / offset(${totals.newVisits_total}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: false
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: circle_outline
    interpolation: monotone
    series_types: {}
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.unique_visitors
        name: Unique Visitors
        axisId: ga_sessions.unique_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 371
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 368
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Users
        axisId: ga_sessions.returning_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 387
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 384
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 403
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 400
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 419
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 416
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Users
        axisId: percent_new_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 435
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 432
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 450
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 447
    colors:
    - "#58A9F5"
    - "#B9E49A"
    - "#FDCB6C"
    - "#F6659A"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    series_colors: {}
    hidden_series:
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - totals.transaction_conversion_rate
    hidden_fields:
    - ga_sessions.session_count
    - sessions
    - totals.timeonsite_average_per_session
    - avg_duration
    - ga_sessions.unique_visitors
    - users
    - totals.transaction_conversion_rate
    - conversion_rate
    - bounce_rate
    - totals.bounce_rate
    - ga_sessions.returning_visitors
    - returning_users
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Host: ga_sessions.has_host
      Page: ga_sessions.has_page
      Goal Selection: ga_sessions.goal_selection
      Search Keyword: trafficSource.keyword
      Property: ga_sessions.property
      Comparison Period Latest: ga_sessions.date_period_comparison_period
    row: 0
    col: 7
    width: 4
    height: 2
  - title: Bounce Rate
    name: Bounce Rate
    model: event_analytics
    explore: ga_sessions
    type: single_value
    fields:
    - ga_sessions.date_period
    - ga_sessions.session_count
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - ga_sessions.returning_visitors
    - totals.transaction_conversion_rate
    - totals.bounce_rate
    sorts:
    - ga_sessions.date_period desc
    limit: 2
    column_limit: 50
    dynamic_fields:
    - table_calculation: sessions
      label: Sessions
      expression: "(${ga_sessions.session_count} - offset(${ga_sessions.session_count},\
        \ 1)) / offset(${ga_sessions.session_count}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: avg_duration
      label: Avg Duration
      expression: "(${totals.timeonsite_average_per_session} - offset(${totals.timeonsite_average_per_session},\
        \ 1)) / offset(${totals.timeonsite_average_per_session}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: users
      label: Users
      expression: "(${ga_sessions.unique_visitors} - offset(${ga_sessions.unique_visitors},\
        \ 1)) / offset(${ga_sessions.unique_visitors}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: returning_users
      label: Returning Users
      expression: "(${ga_sessions.returning_visitors} - offset(${ga_sessions.returning_visitors},\
        \ 1)) / offset(${ga_sessions.returning_visitors}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: conversion_rate
      label: Conversion Rate
      expression: "(${totals.transaction_conversion_rate} - offset(${totals.transaction_conversion_rate},\
        \ 1)) / offset(${totals.transaction_conversion_rate}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: bounce_rate
      label: Bounce Rate
      expression: "(${totals.bounce_rate} - offset(${totals.bounce_rate}, 1)) / offset(${totals.bounce_rate},\
        \ 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: false
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: circle_outline
    interpolation: monotone
    series_types: {}
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.unique_visitors
        name: Unique Visitors
        axisId: ga_sessions.unique_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 843
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 840
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Visitors
        axisId: ga_sessions.returning_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 859
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 856
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 875
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 872
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 891
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 888
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 907
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 904
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 922
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 919
    colors:
    - "#58A9F5"
    - "#B9E49A"
    - "#FDCB6C"
    - "#F6659A"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    series_colors: {}
    hidden_series:
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - totals.transaction_conversion_rate
    hidden_fields:
    - ga_sessions.session_count
    - sessions
    - totals.timeonsite_average_per_session
    - avg_duration
    - ga_sessions.unique_visitors
    - users
    - ga_sessions.returning_visitors
    - returning_users
    - totals.transaction_conversion_rate
    - conversion_rate
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Host: ga_sessions.has_host
      Page: ga_sessions.has_page
      Goal Selection: ga_sessions.goal_selection
      Search Keyword: trafficSource.keyword
      Property: ga_sessions.property
      Comparison Period Latest: ga_sessions.date_period_comparison_period
    row: 0
    col: 11
    width: 3
    height: 2
  - title: Avg Duration
    name: Avg Duration
    model: event_analytics
    explore: ga_sessions
    type: single_value
    fields:
    - ga_sessions.date_period
    - ga_sessions.session_count
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - ga_sessions.returning_visitors
    - totals.transaction_conversion_rate
    - totals.bounce_rate
    sorts:
    - ga_sessions.date_period desc
    limit: 2
    column_limit: 50
    dynamic_fields:
    - table_calculation: sessions
      label: Sessions
      expression: "(${ga_sessions.session_count} - offset(${ga_sessions.session_count},\
        \ 1)) / offset(${ga_sessions.session_count}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: avg_duration
      label: Avg Duration
      expression: "(${totals.timeonsite_average_per_session} - offset(${totals.timeonsite_average_per_session},\
        \ 1)) / offset(${totals.timeonsite_average_per_session}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: users
      label: Users
      expression: "(${ga_sessions.unique_visitors} - offset(${ga_sessions.unique_visitors},\
        \ 1)) / offset(${ga_sessions.unique_visitors}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: returning_users
      label: Returning Users
      expression: "(${ga_sessions.returning_visitors} - offset(${ga_sessions.returning_visitors},\
        \ 1)) / offset(${ga_sessions.returning_visitors}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: conversion_rate
      label: Conversion Rate
      expression: "(${totals.transaction_conversion_rate} - offset(${totals.transaction_conversion_rate},\
        \ 1)) / offset(${totals.transaction_conversion_rate}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: bounce_rate
      label: Bounce Rate
      expression: "(${totals.bounce_rate} - offset(${totals.bounce_rate}, 1)) / offset(${totals.bounce_rate},\
        \ 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: circle_outline
    interpolation: monotone
    series_types: {}
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.unique_visitors
        name: Unique Visitors
        axisId: ga_sessions.unique_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1078
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1075
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Visitors
        axisId: ga_sessions.returning_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1094
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1091
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1110
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1107
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1126
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1123
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1142
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1139
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1157
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1154
    colors:
    - "#58A9F5"
    - "#B9E49A"
    - "#FDCB6C"
    - "#F6659A"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    series_colors: {}
    hidden_series:
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - totals.transaction_conversion_rate
    hidden_fields:
    - ga_sessions.unique_visitors
    - ga_sessions.returning_visitors
    - totals.transaction_conversion_rate
    - totals.bounce_rate
    - users
    - returning_users
    - conversion_rate
    - bounce_rate
    - ga_sessions.session_count
    - sessions
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Host: ga_sessions.has_host
      Page: ga_sessions.has_page
      Goal Selection: ga_sessions.goal_selection
      Search Keyword: trafficSource.keyword
      Property: ga_sessions.property
      Comparison Period Latest: ga_sessions.date_period_comparison_period
    row: 0
    col: 14
    width: 3
    height: 2
  - title: Returning Users
    name: Returning Users
    model: event_analytics
    explore: ga_sessions
    type: single_value
    fields:
    - ga_sessions.date_period
    - ga_sessions.session_count
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - ga_sessions.returning_visitors
    - totals.transaction_conversion_rate
    - totals.bounce_rate
    sorts:
    - ga_sessions.date_period desc
    limit: 2
    column_limit: 50
    dynamic_fields:
    - table_calculation: sessions
      label: Sessions
      expression: "(${ga_sessions.session_count} - offset(${ga_sessions.session_count},\
        \ 1)) / offset(${ga_sessions.session_count}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: avg_duration
      label: Avg Duration
      expression: "(${totals.timeonsite_average_per_session} - offset(${totals.timeonsite_average_per_session},\
        \ 1)) / offset(${totals.timeonsite_average_per_session}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: users
      label: Users
      expression: "(${ga_sessions.unique_visitors} - offset(${ga_sessions.unique_visitors},\
        \ 1)) / offset(${ga_sessions.unique_visitors}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: returning_users
      label: Returning Users
      expression: "(${ga_sessions.returning_visitors} - offset(${ga_sessions.returning_visitors},\
        \ 1)) / offset(${ga_sessions.returning_visitors}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: conversion_rate
      label: Conversion Rate
      expression: "(${totals.transaction_conversion_rate} - offset(${totals.transaction_conversion_rate},\
        \ 1)) / offset(${totals.transaction_conversion_rate}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: bounce_rate
      label: Bounce Rate
      expression: "(${totals.bounce_rate} - offset(${totals.bounce_rate}, 1)) / offset(${totals.bounce_rate},\
        \ 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: circle_outline
    interpolation: monotone
    series_types: {}
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.unique_visitors
        name: Unique Visitors
        axisId: ga_sessions.unique_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1313
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1310
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Visitors
        axisId: ga_sessions.returning_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1329
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1326
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1345
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1342
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1361
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1358
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1377
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1374
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1392
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1389
    colors:
    - "#58A9F5"
    - "#B9E49A"
    - "#FDCB6C"
    - "#F6659A"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    series_colors: {}
    hidden_series:
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - totals.transaction_conversion_rate
    hidden_fields:
    - totals.transaction_conversion_rate
    - totals.bounce_rate
    - conversion_rate
    - bounce_rate
    - ga_sessions.session_count
    - sessions
    - totals.timeonsite_average_per_session
    - avg_duration
    - ga_sessions.unique_visitors
    - users
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Host: ga_sessions.has_host
      Page: ga_sessions.has_page
      Goal Selection: ga_sessions.goal_selection
      Search Keyword: trafficSource.keyword
      Property: ga_sessions.property
      Comparison Period Latest: ga_sessions.date_period_comparison_period
    row: 0
    col: 17
    width: 3
    height: 2
  - title: Conversion Rate
    name: Conversion Rate
    model: event_analytics
    explore: ga_sessions
    type: single_value
    fields:
    - ga_sessions.date_period
    - ga_sessions.session_count
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - ga_sessions.returning_visitors
    - totals.transaction_conversion_rate
    - totals.bounce_rate
    - ga_sessions.selected_goal_conversion_rate
    sorts:
    - ga_sessions.date_period desc
    limit: 2
    column_limit: 50
    dynamic_fields:
    - table_calculation: sessions
      label: Sessions
      expression: "(${ga_sessions.session_count} - offset(${ga_sessions.session_count},\
        \ 1)) / offset(${ga_sessions.session_count}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: avg_duration
      label: Avg Duration
      expression: "(${totals.timeonsite_average_per_session} - offset(${totals.timeonsite_average_per_session},\
        \ 1)) / offset(${totals.timeonsite_average_per_session}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: users
      label: Users
      expression: "(${ga_sessions.unique_visitors} - offset(${ga_sessions.unique_visitors},\
        \ 1)) / offset(${ga_sessions.unique_visitors}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: returning_users
      label: Returning Users
      expression: "(${ga_sessions.returning_visitors} - offset(${ga_sessions.returning_visitors},\
        \ 1)) / offset(${ga_sessions.returning_visitors}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: conversion_rate
      label: Conversion Rate
      expression: "(${totals.transaction_conversion_rate} - offset(${totals.transaction_conversion_rate},\
        \ 1)) / offset(${totals.transaction_conversion_rate}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: bounce_rate
      label: Bounce Rate
      expression: "(${totals.bounce_rate} - offset(${totals.bounce_rate}, 1)) / offset(${totals.bounce_rate},\
        \ 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: selected_goal_conversion_rate
      label: Goal Conversion Rate
      expression: "(${ga_sessions.selected_goal_conversion_rate} - offset(${ga_sessions.selected_goal_conversion_rate},1))\
        \ / offset(${ga_sessions.selected_goal_conversion_rate},1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: circle_outline
    interpolation: monotone
    series_types: {}
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.unique_visitors
        name: Unique Visitors
        axisId: ga_sessions.unique_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1735
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1732
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Visitors
        axisId: ga_sessions.returning_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1751
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1748
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1767
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1764
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1783
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1780
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1799
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1796
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1814
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1811
    colors:
    - "#58A9F5"
    - "#B9E49A"
    - "#FDCB6C"
    - "#F6659A"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    series_colors: {}
    hidden_series:
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - totals.transaction_conversion_rate
    hidden_fields:
    - totals.bounce_rate
    - bounce_rate
    - ga_sessions.session_count
    - sessions
    - totals.timeonsite_average_per_session
    - avg_duration
    - ga_sessions.unique_visitors
    - users
    - ga_sessions.returning_visitors
    - returning_users
    - totals.transaction_conversion_rate
    - conversion_rate
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Host: ga_sessions.has_host
      Page: ga_sessions.has_page
      Goal Selection: ga_sessions.goal_selection
      Search Keyword: trafficSource.keyword
      Property: ga_sessions.property
      Comparison Period Latest: ga_sessions.date_period_comparison_period
    row: 0
    col: 20
    width: 4
    height: 2
  - title: Time Series
    name: Time Series
    model: event_analytics
    explore: ga_sessions
    type: looker_line
    fields:
    - ga_sessions.visitStart_date
    - ga_sessions.unique_visitors
    - ga_sessions.returning_visitors
    - totals.bounce_rate
    - totals.timeonsite_average_per_session
    - ga_sessions.percent_new_users
    - ga_sessions.selected_goal_conversion_rate
    fill_fields:
    - ga_sessions.visitStart_date
    sorts:
    - ga_sessions.visitStart_date desc
    limit: 364
    column_limit: 50
    stacking: ''
    colors:
    - "#58A9F5"
    - "#B9E49A"
    - "#FDCB6C"
    - "#F6659A"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: false
    show_view_names: false
    point_style: circle_outline
    series_colors: {}
    series_types: {}
    limit_displayed_rows: false
    hidden_series:
    - ga_sessions.returning_visitors
    - totals.bounce_rate
    - totals.timeonsite_average_per_session
    - ga_sessions.percent_new_users
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.unique_visitors
        name: Unique Users
        axisId: ga_sessions.unique_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1498
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1495
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Users
        axisId: ga_sessions.returning_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1514
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1511
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Avg Session Duration
        axisId: totals.timeonsite_average_per_session
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1530
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1527
    - label: ''
      orientation: left
      series:
      - id: totals.bounce_rate
        name: Bounce Rate
        axisId: totals.bounce_rate
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1546
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1543
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.percent_new_users
        name: Percent New Users
        axisId: ga_sessions.percent_new_users
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1561
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1558
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.selected_goal_conversion_rate
        name: Goal Conversion Rate
        axisId: ga_sessions.selected_goal_conversion_rate
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1576
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1573
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: monotone
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    hidden_fields: []
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Host: ga_sessions.has_host
      Page: ga_sessions.has_page
      Goal Selection: ga_sessions.goal_selection
      Search Keyword: trafficSource.keyword
      Property: ga_sessions.property
      Comparison Period Latest: ga_sessions.date_period_comparison_period
    row: 2
    col: 0
    width: 24
    height: 7
  - title: Engagement by Traffic Source
    name: Engagement by Traffic Source
    model: event_analytics
    explore: ga_sessions
    type: looker_bar
    fields:
    - ga_sessions.channelGrouping
    - totals.timeonsite_average_per_session
    - ga_sessions.percent_new_users
    - ga_sessions.selected_goal_conversion_rate
    - ga_sessions.unique_visitors
    sorts:
    - ga_sessions.unique_visitors desc
    limit: 8
    column_limit: 50
    stacking: ''
    colors:
    - "#F6659A"
    - "#B9E49A"
    - "#58A9F5"
    - "#FDCB6C"
    - "#58A9F5"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    point_style: circle_outline
    series_colors:
      ga_sessions.selected_goal_conversion_rate: "#BFBFBF"
      ga_sessions.unique_visitors: "#58A9F5"
    series_labels:
      totals.transaction_conversion_rate: Conversion Rate
      ga_sessions.unique_visitors: Users
    series_types:
      totals.transaction_conversion_rate: line
      totals.timeonsite_total: line
      new_users: line
      ga_sessions.percent_new_users: line
      ga_sessions.selected_goal_conversion_rate: line
      totals.timeonsite_average_per_session: line
    limit_displayed_rows: false
    hidden_series:
    - ga_sessions.percent_new_users
    - ga_sessions.selected_goal_conversion_rate
    y_axes:
    - label:
      orientation: bottom
      series:
      - id: ga_sessions.unique_visitors
        name: Users
        axisId: ga_sessions.unique_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1928
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1925
    - label: ''
      orientation: bottom
      series:
      - id: ga_sessions.percent_new_users
        name: Percent New Users
        axisId: ga_sessions.percent_new_users
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1944
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1941
    - label: ''
      orientation: bottom
      series:
      - id: ga_sessions.selected_goal_conversion_rate
        name: Goal Conversion Rate
        axisId: ga_sessions.selected_goal_conversion_rate
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1959
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1956
    - label: ''
      orientation: bottom
      series:
      - id: totals.timeonsite_average_per_session
        name: Avg Session Duration
        axisId: totals.timeonsite_average_per_session
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 1974
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 1971
    y_axis_combined: true
    show_y_axis_labels: false
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_label_rotation: -45
    show_null_points: true
    interpolation: monotone
    hidden_fields: []
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Host: ga_sessions.has_host
      Page: ga_sessions.has_page
      Goal Selection: ga_sessions.goal_selection
      Search Keyword: trafficSource.keyword
      Property: ga_sessions.property
      Comparison Period Latest: ga_sessions.date_period_comparison_period
    row: 11
    col: 0
    width: 8
    height: 13
  - title: Engagement by Medium
    name: Engagement by Medium
    model: event_analytics
    explore: ga_sessions
    type: looker_bar
    fields:
    - trafficSource.medium
    - totals.timeonsite_average_per_session
    - ga_sessions.percent_new_users
    - ga_sessions.selected_goal_conversion_rate
    - ga_sessions.unique_visitors
    sorts:
    - ga_sessions.unique_visitors desc
    limit: 8
    column_limit: 50
    stacking: ''
    colors:
    - "#F6659A"
    - "#B9E49A"
    - "#58A9F5"
    - "#FDCB6C"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_colors:
      ga_sessions.unique_visitors: "#58A9F5"
      ga_sessions.selected_goal_conversion_rate: "#BFBFBF"
    series_labels:
      ga_sessions.unique_visitors: Users
      totals.transaction_conversion_rate: Conversion Rate
    series_types:
      totals.timeonsite_total: line
      totals.transaction_conversion_rate: line
      new_users: line
      ga_sessions.percent_new_users: line
      ga_sessions.selected_goal_conversion_rate: line
      totals.timeonsite_average_per_session: line
    limit_displayed_rows: false
    hidden_series:
    - ga_sessions.percent_new_users
    - ga_sessions.selected_goal_conversion_rate
    y_axes:
    - label:
      orientation: top
      series:
      - id: ga_sessions.unique_visitors
        name: Users
        axisId: ga_sessions.unique_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 2078
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 2075
    - label: ''
      orientation: bottom
      series:
      - id: ga_sessions.percent_new_users
        name: Percent New Users
        axisId: ga_sessions.percent_new_users
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 2094
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 2091
    - label: ''
      orientation: bottom
      series:
      - id: ga_sessions.selected_goal_conversion_rate
        name: Goal Conversion Rate
        axisId: ga_sessions.selected_goal_conversion_rate
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 2109
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 2106
    - label: ''
      orientation: bottom
      series:
      - id: totals.timeonsite_average_per_session
        name: Avg Session Duration
        axisId: totals.timeonsite_average_per_session
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 2124
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 2121
    y_axis_combined: true
    show_y_axis_labels: false
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_label_rotation: -45
    show_null_points: true
    interpolation: monotone
    hidden_fields: []
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Host: ga_sessions.has_host
      Page: ga_sessions.has_page
      Goal Selection: ga_sessions.goal_selection
      Search Keyword: trafficSource.keyword
      Property: ga_sessions.property
      Comparison Period Latest: ga_sessions.date_period_comparison_period
    row: 11
    col: 8
    width: 8
    height: 13
  - title: When are Your Users Coming?
    name: When are Your Users Coming?
    model: event_analytics
    explore: ga_sessions
    type: table
    fields:
    - ga_sessions.visitStart_hour_of_day
    - ga_sessions.visitStart_day_of_week
    - ga_sessions.session_count
    pivots:
    - ga_sessions.visitStart_day_of_week
    fill_fields:
    - ga_sessions.visitStart_hour_of_day
    - ga_sessions.visitStart_day_of_week
    sorts:
    - ga_sessions.visitStart_day_of_week 0
    - ga_sessions.visitStart_hour_of_day
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    conditional_formatting:
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Custom
        colors:
        - "#fff"
        - "#58A9F5"
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 2395
      bold: false
      italic: false
      strikethrough: false
      fields:
      - ga_sessions.session_count
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 2390
    series_labels:
      ga_sessions.visitStart_hour_of_day: Hour of Day
      ga_sessions.visitStart_day_of_week: Day of Week
    note_state: collapsed
    note_display: above
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Host: ga_sessions.has_host
      Page: ga_sessions.has_page
      Goal Selection: ga_sessions.goal_selection
      Search Keyword: trafficSource.keyword
      Property: ga_sessions.property
      Comparison Period Latest: ga_sessions.date_period_comparison_period
    row: 24
    col: 0
    width: 12
    height: 12
  - title: Engagement by Referrals
    name: Engagement by Referrals
    model: event_analytics
    explore: ga_sessions
    type: looker_bar
    fields:
    - trafficSource.referralPath
    - totals.timeonsite_average_per_session
    - ga_sessions.percent_new_users
    - ga_sessions.selected_goal_conversion_rate
    - ga_sessions.unique_visitors
    filters:
      trafficSource.referralPath: "-NULL"
    sorts:
    - ga_sessions.unique_visitors desc
    limit: 7
    column_limit: 50
    dynamic_fields:
    - table_calculation: referral
      label: Referral
      expression: substring(${trafficSource.referralPath},0,12)
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: string
    stacking: ''
    colors:
    - "#F6659A"
    - "#B9E49A"
    - "#58A9F5"
    - "#FDCB6C"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_colors:
      ga_sessions.unique_visitors: "#58A9F5"
      ga_sessions.selected_goal_conversion_rate: "#BFBFBF"
    series_labels:
      ga_sessions.unique_visitors: Unique Users
      totals.transaction_conversion_rate: Conversion Rate
    series_types:
      totals.timeonsite_total: line
      totals.transaction_conversion_rate: line
      new_users: line
      ga_sessions.percent_new_users: line
      ga_sessions.selected_goal_conversion_rate: line
      totals.timeonsite_average_per_session: line
    limit_displayed_rows: false
    hidden_series:
    - ga_sessions.percent_new_users
    - ga_sessions.selected_goal_conversion_rate
    y_axes:
    - label:
      orientation: bottom
      series:
      - id: ga_sessions.unique_visitors
        name: Unique Users
        axisId: ga_sessions.unique_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 2237
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 2234
    - label:
      orientation: bottom
      series:
      - id: ga_sessions.percent_new_users
        name: Percent New Users
        axisId: ga_sessions.percent_new_users
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 2253
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 2250
    - label: ''
      orientation: bottom
      series:
      - id: ga_sessions.selected_goal_conversion_rate
        name: Goal Conversion Rate
        axisId: ga_sessions.selected_goal_conversion_rate
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 2269
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 2266
    - label: ''
      orientation: bottom
      series:
      - id: totals.timeonsite_average_per_session
        name: Avg Session Duration
        axisId: totals.timeonsite_average_per_session
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 2284
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 2281
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_label_rotation: -45
    show_null_points: true
    interpolation: monotone
    hidden_fields:
    - trafficSource.referralPath
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Host: ga_sessions.has_host
      Page: ga_sessions.has_page
      Goal Selection: ga_sessions.goal_selection
      Search Keyword: trafficSource.keyword
      Property: ga_sessions.property
      Comparison Period Latest: ga_sessions.date_period_comparison_period
    row: 11
    col: 16
    width: 8
    height: 13
  - title: Users by Country
    name: Users by Country
    model: event_analytics
    explore: ga_sessions
    type: looker_map
    fields:
    - geoNetwork.country
    - ga_sessions.unique_visitors
    sorts:
    - geoNetwork.country
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map: usa
    map_projection: ''
    quantize_colors: false
    series_types: {}
    map_latitude: 44.33956524809713
    map_longitude: 0
    map_zoom: 1
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Host: ga_sessions.has_host
      Page: ga_sessions.has_page
      Goal Selection: ga_sessions.goal_selection
      Search Keyword: trafficSource.keyword
      Property: ga_sessions.property
      Comparison Period Latest: ga_sessions.date_period_comparison_period
    row: 24
    col: 12
    width: 12
    height: 12
  - title: Social Breakdown
    name: Social Breakdown
    model: event_analytics
    explore: ga_sessions
    type: looker_column
    fields:
    - hits_social.socialNetwork
    - ga_sessions.percent_new_users
    - totals.timeonsite_average_per_session
    - ga_sessions.selected_goal_conversion_rate
    - ga_sessions.unique_visitors
    sorts:
    - ga_sessions.unique_visitors desc
    limit: 10
    column_limit: 50
    stacking: ''
    colors:
    - "#B9E49A"
    - "#5EC0C4"
    - "#58A9F5"
    - "#FDCB6C"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    point_style: circle_outline
    series_colors:
      ga_sessions.unique_visitors: "#58A9F5"
      ga_sessions.selected_goal_conversion_rate: "#BFBFBF"
      totals.timeonsite_average_per_session: "#F6659A"
    series_labels:
      totals.transaction_conversion_rate: Conversion Rate
      ga_sessions.unique_visitors: Users
    series_types:
      ga_sessions.selected_goal_conversion_rate: line
      ga_sessions.percent_new_users: line
      totals.timeonsite_total: line
      totals.timeonsite_average_per_session: line
    limit_displayed_rows: false
    hidden_series:
    - ga_sessions.percent_new_users
    - ga_sessions.selected_goal_conversion_rate
    y_axes:
    - label:
      orientation: left
      series:
      - id: ga_sessions.unique_visitors
        name: Users
        axisId: ga_sessions.unique_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 2539
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: custom
      tickDensityCustom: 3
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 2536
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.percent_new_users
        name: Percent New Users
        axisId: ga_sessions.percent_new_users
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 2555
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 2552
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.selected_goal_conversion_rate
        name: Goal Conversion Rate
        axisId: ga_sessions.selected_goal_conversion_rate
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 2570
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 2567
    - label: ''
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Avg Session Duration
        axisId: totals.timeonsite_average_per_session
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 2585
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 2582
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_label_rotation: -45
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: monotone
    hidden_fields: []
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Host: ga_sessions.has_host
      Page: ga_sessions.has_page
      Goal Selection: ga_sessions.goal_selection
      Search Keyword: trafficSource.keyword
      Property: ga_sessions.property
      Comparison Period Latest: ga_sessions.date_period_comparison_period
    row: 38
    col: 0
    width: 12
    height: 7
  - title: Mobile  Breakdown
    name: Mobile  Breakdown
    model: event_analytics
    explore: ga_sessions
    type: looker_pie
    fields:
    - ga_sessions.unique_visitors
    - device.isMobile
    sorts:
    - ga_sessions.unique_visitors desc
    limit: 8
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 60
    colors:
    - "#58A9F5"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    series_colors: {}
    series_labels:
      totals.transaction_conversion_rate: Conversion Rate
      ga_sessions.unique_visitors: Users
      'No': Other
      'Yes': Mobile
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle
    series_types: {}
    limit_displayed_rows: false
    hidden_series:
    - totals.avg_pageview_per_user
    - ga_sessions.average_sessions_per_visitor
    y_axes:
    - label:
      orientation: left
      series:
      - id: ga_sessions.unique_visitors
        name: Users
        axisId: ga_sessions.unique_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 2680
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 2677
    - label: ''
      orientation: left
      series:
      - id: totals.transaction_conversion_rate
        name: Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 2696
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 2693
    - label: ''
      orientation: left
      series:
      - id: totals.timeonsite_total
        name: Time On Site
        axisId: totals.timeonsite_total
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 2711
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 2708
    - label: ''
      orientation: right
      series:
      - id: new_users
        name: "% New Users"
        axisId: new_users
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 2726
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 2723
    y_axis_combined: true
    show_y_axis_labels: false
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: false
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_label_rotation: -45
    show_null_points: true
    interpolation: monotone
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Host: ga_sessions.has_host
      Page: ga_sessions.has_page
      Goal Selection: ga_sessions.goal_selection
      Search Keyword: trafficSource.keyword
      Property: ga_sessions.property
      Comparison Period Latest: ga_sessions.date_period_comparison_period
    row: 38
    col: 12
    width: 12
    height: 7
  - title: Top Search Keywords
    name: Top Search Keywords
    model: event_analytics
    explore: ga_sessions
    type: looker_bar
    fields:
    - trafficSource.keyword
    - totals.timeonsite_average_per_session
    - ga_sessions.percent_new_users
    - ga_sessions.selected_goal_conversion_rate
    - ga_sessions.unique_visitors
    sorts:
    - ga_sessions.unique_visitors desc
    limit: 10
    column_limit: 50
    stacking: ''
    colors:
    - "#B9E49A"
    - "#5EC0C4"
    - "#58A9F5"
    - "#FDCB6C"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_colors:
      ga_sessions.unique_visitors: "#58A9F5"
      ga_sessions.selected_goal_conversion_rate: "#BFBFBF"
      totals.timeonsite_average_per_session: "#F6659A"
    series_labels:
      ga_sessions.unique_visitors: Users
      totals.transaction_conversion_rate: Conversion Rate
    series_types:
      totals.transaction_conversion_rate: line
      totals.timeonsite_total: line
      new_users: line
      ga_sessions.percent_new_users: line
      ga_sessions.selected_goal_conversion_rate: line
      totals.timeonsite_average_per_session: line
    limit_displayed_rows: false
    hidden_series:
    - totals.timeonsite_total
    - ga_sessions.percent_new_users
    - ga_sessions.selected_goal_conversion_rate
    y_axes:
    - label:
      orientation: bottom
      series:
      - id: ga_sessions.unique_visitors
        name: Users
        axisId: ga_sessions.unique_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 2832
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 2829
    - label: ''
      orientation: bottom
      series:
      - id: ga_sessions.percent_new_users
        name: Percent New Users
        axisId: ga_sessions.percent_new_users
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 2848
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 2845
    - label: ''
      orientation: bottom
      series:
      - id: ga_sessions.selected_goal_conversion_rate
        name: Goal Conversion Rate
        axisId: ga_sessions.selected_goal_conversion_rate
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 2863
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 2860
    - label: ''
      orientation: bottom
      series:
      - id: totals.timeonsite_average_per_session
        name: Avg Session Duration
        axisId: totals.timeonsite_average_per_session
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 2878
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 2875
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_label_rotation: -45
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_null_points: true
    interpolation: monotone
    hidden_fields: []
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Host: ga_sessions.has_host
      Page: ga_sessions.has_page
      Goal Selection: ga_sessions.goal_selection
      Search Keyword: trafficSource.keyword
      Property: ga_sessions.property
      Comparison Period Latest: ga_sessions.date_period_comparison_period
    row: 45
    col: 0
    width: 12
    height: 12
  - title: Top Landing Pages
    name: Top Landing Pages
    model: event_analytics
    explore: ga_sessions
    type: table
    fields:
    - first_page.pageTitle
    - ga_sessions.session_count
    - ga_sessions.percent_new_users
    - totals.bounce_rate
    - totals.timeonsite_average_per_session
    - ga_sessions.selected_goal_conversion_rate
    sorts:
    - ga_sessions.session_count desc
    limit: 25
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting:
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Custom
        colors:
        - "#FFFFFF"
        - "#58A9F5"
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 2965
      bold: false
      italic: false
      strikethrough: false
      fields:
      - ga_sessions.session_count
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 2960
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Custom
        colors:
        - "#FFFFFF"
        - "#58A9F5"
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 2983
      bold: false
      italic: false
      strikethrough: false
      fields:
      - ga_sessions.percent_new_users
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 2978
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Custom
        colors:
        - "#FFFFFF"
        - "#58A9F5"
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 3001
      bold: false
      italic: false
      strikethrough: false
      fields:
      - totals.timeonsite_average_per_session
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 2996
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Custom
        colors:
        - "#FFFFFF"
        - "#58A9F5"
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 3019
      bold: false
      italic: false
      strikethrough: false
      fields:
      - ga_sessions.selected_goal_conversion_rate
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 3014
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: circle
    interpolation: monotone
    series_types: {}
    y_axes:
    - label: ''
      orientation: bottom
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 3064
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 3061
    - label:
      orientation: bottom
      series:
      - id: ga_sessions.unique_visitors
        name: Unique Visitors
        axisId: ga_sessions.unique_visitors
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 3080
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: custom
      tickDensityCustom: 3
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 3077
    - label: ''
      orientation: bottom
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: app-event-ga360/acquisition.dashboard.lookml
        __LINE_NUM: 3096
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app-event-ga360/acquisition.dashboard.lookml
      __LINE_NUM: 3093
    colors:
    - "#B9E49A"
    - "#FDCB6C"
    - "#58A9F5"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    series_colors: {}
    hidden_series:
    - totals.transaction_conversion_rate
    - totals.timeonsite_average_per_session
    x_axis_label_rotation: -45
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Host: ga_sessions.has_host
      Page: ga_sessions.has_page
      Goal Selection: ga_sessions.goal_selection
      Search Keyword: trafficSource.keyword
      Property: ga_sessions.property
      Comparison Period Latest: ga_sessions.date_period_comparison_period
    row: 45
    col: 12
    width: 12
    height: 12
  filters:
  - name: Period
    title: Period
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    model: event_analytics
    explore: ga_sessions
    listens_to_filters: []
    field: ga_sessions.period
  - name: Campaign
    title: Campaign
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: event_analytics
    explore: ga_sessions
    listens_to_filters: []
    field: trafficSource.campaign
  - name: First Time Visitor
    title: First Time Visitor
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: event_analytics
    explore: ga_sessions
    listens_to_filters: []
    field: ga_sessions.first_time_visitor
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: event_analytics
    explore: ga_sessions
    listens_to_filters: []
    field: geoNetwork.country
  - name: Host
    title: Host
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: event_analytics
    explore: ga_sessions
    listens_to_filters: []
    field: ga_sessions.has_host
  - name: Page
    title: Page
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: event_analytics
    explore: ga_sessions
    listens_to_filters: []
    field: ga_sessions.has_page
  - name: Goal Selection
    title: Goal Selection
    type: field_filter
    default_value: Demo
    allow_multiple_values: true
    required: false
    model: event_analytics
    explore: ga_sessions
    listens_to_filters: []
    field: ga_sessions.goal_selection
  - name: Search Keyword
    title: Search Keyword
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: event_analytics
    explore: ga_sessions
    listens_to_filters: []
    field: trafficSource.keyword
  - name: Property
    title: Property
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: event_analytics
    explore: ga_sessions
    listens_to_filters: []
    field: ga_sessions.property
  - name: Comparison Period Latest
    title: Comparison Period Latest
    type: field_filter
    default_value: 'Yes'
    allow_multiple_values: true
    required: false
    model: event_analytics
    explore: ga_sessions
    listens_to_filters: []
    field: ga_sessions.date_period_comparison_period

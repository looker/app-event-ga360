- dashboard: conversions
  title: Conversions
  layout: newspaper
  extends: event_analytics_dash_base
  embed_style:
    background_color: "#ffffff"
    title_color: "#3a4245"
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
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
    filters:
      geoNetwork.country: ''
      ga_sessions.date_period_comparison_period: 'Yes'
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
        name: Users
        axisId: ga_sessions.unique_visitors
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 369
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 366
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Users
        axisId: ga_sessions.returning_visitors
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 385
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 382
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 401
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 398
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 417
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 414
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 433
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 430
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 448
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 445
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
    - ga_sessions.returning_visitors
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time User: ga_sessions.first_time_visitor
    row: 0
    col: 0
    width: 4
    height: 3
  - title: Conversions
    name: Conversions
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
    - totals.transactions_count
    - ga_sessions.goal_conversions
    filters:
      geoNetwork.country: ''
      ga_sessions.date_period_comparison_period: 'Yes'
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
    - table_calculation: total_transactions
      label: Total Transactions
      expression: "(${totals.transactions_count} - offset(${totals.transactions_count},\
        \ 1)) / offset(${totals.transactions_count}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: goal_conversions
      label: Goal Conversions
      expression: "(${ga_sessions.goal_conversions} - offset(${ga_sessions.goal_conversions},\
        \ 1)) / offset(${ga_sessions.goal_conversions}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: Conversions
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
        name: Users
        axisId: ga_sessions.unique_visitors
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 137
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 134
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Users
        axisId: ga_sessions.returning_visitors
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 153
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 150
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 169
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 166
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 185
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 182
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 201
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 198
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 216
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 213
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
    - ga_sessions.returning_visitors
    - ga_sessions.unique_visitors
    - users
    - returning_users
    - totals.transactions_count
    - total_transactions
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time User: ga_sessions.first_time_visitor
    row: 0
    col: 4
    width: 4
    height: 3
  - title: Top Medium
    name: Top Medium
    model: event_analytics
    explore: ga_sessions
    type: looker_bar
    fields:
    - trafficSource.medium
    - ga_sessions.goal_conversion_rate
    - ga_sessions.goal_conversions
    - ga_sessions.total_visitors
    filters:
      trafficSource.keyword: "-NULL"
      ga_sessions.date_period_latest: 'Yes'
    sorts:
    - ga_sessions.total_visitors desc
    limit: 10
    column_limit: 50
    dynamic_fields:
    - table_calculation: medium
      label: Medium
      expression: substring(${trafficSource.medium},0,16)
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: string
    stacking: ''
    colors:
    - "#B9E49A"
    - "#FF666C"
    - "#58A9F5"
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
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle
    series_colors:
      totals.transaction_conversion_rate: "#5EC0C4"
      ga_sessions.total_visitors: "#FDCB6C"
      ga_sessions.goal_conversion_rate: "#58A9F5"
    series_labels:
      ga_sessions.total_visitors: Users
      totals.transactions_count: Conversions
      totals.transactionRevenue_total: Total Value
      percent_of_visitors_w_transactions: "% Converting Users"
      totals.transaction_conversion_rate: Conversion Rate
    series_types:
      ga_sessions.goal_conversion_rate: line
      ga_sessions.goal_conversions: line
    limit_displayed_rows: false
    hidden_series:
    - ga_sessions.goal_conversions
    y_axes:
    - label: ''
      orientation: bottom
      series:
      - id: ga_sessions.total_visitors
        name: Users
        axisId: ga_sessions.total_visitors
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: bottom
      series:
      - id: ga_sessions.goal_conversions
        name: Goal Conversions
        axisId: ga_sessions.goal_conversions
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: bottom
      series:
      - id: ga_sessions.goal_conversion_rate
        name: Goal Conversion Rate
        axisId: ga_sessions.goal_conversion_rate
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_labels: []
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
    query_timezone: America/Los_Angeles
    show_null_points: true
    interpolation: monotone
    y_axis_orientation:
    - left
    - right
    hidden_fields:
    - trafficSource.medium
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time User: ga_sessions.first_time_visitor
    row: 12
    col: 0
    width: 8
    height: 10
  - title: Top Referrers
    name: Top Referrers
    model: event_analytics
    explore: ga_sessions
    type: looker_bar
    fields:
    - trafficSource.source
    - ga_sessions.goal_conversion_rate
    - ga_sessions.goal_conversions
    - ga_sessions.total_visitors
    filters:
      trafficSource.keyword: "-NULL"
      ga_sessions.date_period_latest: 'Yes'
    sorts:
    - ga_sessions.total_visitors desc
    limit: 10
    column_limit: 50
    stacking: ''
    colors:
    - "#B9E49A"
    - "#FF666C"
    - "#58A9F5"
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
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle
    series_colors:
      totals.transaction_conversion_rate: "#5EC0C4"
      ga_sessions.total_visitors: "#FDCB6C"
      ga_sessions.goal_conversion_rate: "#58A9F5"
    series_labels:
      ga_sessions.total_visitors: Users
      totals.transactions_count: Conversions
      totals.transactionRevenue_total: Total Value
      percent_of_visitors_w_transactions: "% Converting Users"
      totals.transaction_conversion_rate: Conversion Rate
    series_types:
      ga_sessions.goal_conversion_rate: line
      ga_sessions.goal_conversions: line
    limit_displayed_rows: false
    hidden_series:
    - ga_sessions.goal_conversions
    y_axes:
    - label: ''
      orientation: bottom
      series:
      - id: ga_sessions.total_visitors
        name: Users
        axisId: ga_sessions.total_visitors
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: bottom
      series:
      - id: ga_sessions.goal_conversions
        name: Goal Conversions
        axisId: ga_sessions.goal_conversions
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: bottom
      series:
      - id: ga_sessions.goal_conversion_rate
        name: Goal Conversion Rate
        axisId: ga_sessions.goal_conversion_rate
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_labels: []
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
    query_timezone: America/Los_Angeles
    show_null_points: true
    interpolation: monotone
    y_axis_orientation:
    - left
    - right
    hidden_fields:
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time User: ga_sessions.first_time_visitor
    row: 12
    col: 8
    width: 8
    height: 10
  - title: Top Channels
    name: Top Channels
    model: event_analytics
    explore: ga_sessions
    type: looker_bar
    fields:
    - ga_sessions.channelGrouping
    - ga_sessions.goal_conversion_rate
    - ga_sessions.goal_conversions
    - ga_sessions.total_visitors
    filters:
      trafficSource.keyword: "-NULL"
      ga_sessions.date_period_latest: 'Yes'
    sorts:
    - ga_sessions.total_visitors desc
    limit: 10
    column_limit: 50
    stacking: ''
    colors:
    - "#B9E49A"
    - "#FF666C"
    - "#58A9F5"
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
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle
    series_colors:
      totals.transaction_conversion_rate: "#5EC0C4"
      ga_sessions.total_visitors: "#FDCB6C"
      ga_sessions.goal_conversion_rate: "#58A9F5"
    series_labels:
      ga_sessions.total_visitors: Users
      totals.transactions_count: Conversions
      totals.transactionRevenue_total: Total Value
      percent_of_visitors_w_transactions: "% Converting Users"
      totals.transaction_conversion_rate: Conversion Rate
    series_types:
      ga_sessions.goal_conversion_rate: line
      ga_sessions.goal_conversions: line
    limit_displayed_rows: false
    hidden_series:
    - ga_sessions.goal_conversions
    y_axes:
    - label: ''
      orientation: bottom
      series:
      - id: ga_sessions.total_visitors
        name: Users
        axisId: ga_sessions.total_visitors
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: bottom
      series:
      - id: ga_sessions.goal_conversions
        name: Goal Conversions
        axisId: ga_sessions.goal_conversions
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: bottom
      series:
      - id: ga_sessions.goal_conversion_rate
        name: Goal Conversion Rate
        axisId: ga_sessions.goal_conversion_rate
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_labels: []
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
    query_timezone: America/Los_Angeles
    show_null_points: true
    interpolation: monotone
    y_axis_orientation:
    - left
    - right
    hidden_fields:
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time User: ga_sessions.first_time_visitor
    row: 12
    col: 16
    width: 8
    height: 10
  - title: Conversions by Geo
    name: Conversions by Geo
    model: event_analytics
    explore: ga_sessions
    type: looker_map
    fields:
    - geoNetwork.country
    - ga_sessions.goal_conversions
    filters:
      trafficSource.keyword: "-NULL"
      ga_sessions.date_period_latest: 'Yes'
    limit: 500
    column_limit: 50
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
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    value_labels: labels
    label_type: labPer
    show_value_labels: true
    font_size: 12
    stacking: ''
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: circle
    limit_displayed_rows: false
    y_axis_combined: false
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
    query_timezone: America/Los_Angeles
    show_null_points: true
    interpolation: monotone
    series_types: {}
    y_axis_labels: []
    hidden_series: []
    y_axis_orientation:
    - left
    - right
    hidden_fields:
    series_colors:
      'true': "#58A9F5"
      'false': "#FDCB6C"
    series_labels:
      'false': Desktop
      'true': Mobile
    y_axes:
    - label: Transaction Revenue
      orientation: top
      series:
      - id: total_transaction_revenue
        name: Total Transaction Revenue
        axisId: total_transaction_revenue
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 1050
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 1047
    - label:
      orientation: top
      series:
      - id: average_transaction_revenue
        name: Average Transaction Revenue
        axisId: average_transaction_revenue
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 1069
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 1066
    - label: ''
      orientation: bottom
      series:
      - id: percent_of_visitors_w_transactions
        name: Percent of Users w/ Transactions
        axisId: percent_of_visitors_w_transactions
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 1088
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 1085
    colors:
    - "#B9E49A"
    - "#FF666C"
    - "#58A9F5"
    - "#FDCB6C"
    - "#F6659A"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    map_latitude: 46.292866664344295
    map_longitude: 14.942779541015627
    map_zoom: 2
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time User: ga_sessions.first_time_visitor
    row: 22
    col: 0
    width: 16
    height: 7
  - title: Mobile Conversions
    name: Mobile Conversions
    model: event_analytics
    explore: ga_sessions
    type: looker_pie
    fields:
    - device.isMobile
    - ga_sessions.goal_conversions
    filters:
      ga_sessions.date_period_latest: 'Yes'
    limit: 10
    column_limit: 50
    value_labels: labels
    label_type: labPer
    colors:
    - "#FDCB6C"
    - "#58A9F5"
    - "#FDCB6C"
    - "#F6659A"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    series_colors: {}
    series_labels:
      'false': Desktop
      'true': Mobile
    show_value_labels: true
    font_size: 12
    stacking: ''
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle
    limit_displayed_rows: false
    y_axis_combined: false
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
    query_timezone: America/Los_Angeles
    show_null_points: true
    interpolation: monotone
    series_types: {}
    y_axis_labels: []
    hidden_series: []
    y_axis_orientation:
    - left
    - right
    hidden_fields:
    y_axes:
    - label: Transaction Revenue
      orientation: top
      series:
      - id: total_transaction_revenue
        name: Total Transaction Revenue
        axisId: total_transaction_revenue
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 1190
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 1187
    - label:
      orientation: top
      series:
      - id: average_transaction_revenue
        name: Average Transaction Revenue
        axisId: average_transaction_revenue
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 1209
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 1206
    - label: ''
      orientation: bottom
      series:
      - id: percent_of_visitors_w_transactions
        name: Percent of Users w/ Transactions
        axisId: percent_of_visitors_w_transactions
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 1228
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 1225
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time User: ga_sessions.first_time_visitor
    row: 22
    col: 16
    width: 8
    height: 7
  - title: Top Converting Landing Pages
    name: Top Converting Landing Pages
    model: event_analytics
    explore: ga_sessions
    type: table
    fields:
    - first_page.pageTitle
    - ga_sessions.goal_conversion_rate
    - ga_sessions.goal_conversions
    - ga_sessions.unique_visitors
    filters:
      ga_sessions.date_period_latest: 'Yes'
    sorts:
    - ga_sessions.goal_conversions desc
    limit: 25
    column_limit: 10
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      ga_sessions.total_visitors: Users
      totals.transactions_count: Conversions
      totals.transactionRevenue_total: Total Value
      percent_of_visitors_w_transactions: "% Converting Users"
      totals.transaction_conversion_rate: Conversion Rate
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting:
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Custom
        colors:
        - "#FFFFFF"
        - "#FDCB6C"
      bold: false
      italic: false
      strikethrough: false
      fields:
      - ga_sessions.goal_conversions
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 1982
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Custom
        colors:
        - "#FFFFFF"
        - "#FDCB6C"
      bold: false
      italic: false
      strikethrough: false
      fields:
      - ga_sessions.goal_conversion_rate
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 2000
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: circle
    y_axis_combined: false
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    query_timezone: America/Los_Angeles
    show_null_points: true
    interpolation: monotone
    series_types: {}
    y_axis_labels: []
    hidden_series:
    - ga_sessions.total_visitors
    - totals.transactionRevenue_total
    - totals.average_revenue_per_transaction
    y_axis_orientation:
    - left
    - right
    hidden_fields:
    series_colors:
      totals.transaction_conversion_rate: "#5EC0C4"
    y_axes:
    - label: ''
      orientation: bottom
      series:
      - id: ga_sessions.total_visitors
        name: Users
        axisId: ga_sessions.total_visitors
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 1919
      - id: totals.transactions_count
        name: Conversions
        axisId: totals.transactions_count
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 1924
      - id: totals.transactionRevenue_total
        name: Total Value
        axisId: totals.transactionRevenue_total
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 1929
      - id: totals.average_revenue_per_transaction
        name: Average Revenue per Transaction
        axisId: totals.average_revenue_per_transaction
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 1934
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 1916
    - label:
      orientation: bottom
      series:
      - id: totals.transaction_conversion_rate
        name: Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 1953
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 1950
    colors:
    - "#B9E49A"
    - "#FF666C"
    - "#58A9F5"
    - "#FDCB6C"
    - "#F6659A"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time User: ga_sessions.first_time_visitor
    row: 29
    col: 11
    width: 13
    height: 12
  - title: Top Converting Keywords
    name: Top Converting Keywords
    model: event_analytics
    explore: ga_sessions
    type: table
    fields:
    - trafficSource.keyword
    - ga_sessions.goal_conversion_rate
    - ga_sessions.goal_conversions
    - ga_sessions.unique_visitors
    filters:
      ga_sessions.date_period_latest: 'Yes'
    sorts:
    - ga_sessions.unique_visitors desc
    limit: 25
    column_limit: 10
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      ga_sessions.total_visitors: Users
      totals.transactions_count: Conversions
      totals.transactionRevenue_total: Total Value
      percent_of_visitors_w_transactions: "% Converting Users"
      totals.transaction_conversion_rate: Conversion Rate
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting:
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Custom
        colors:
        - "#FFFFFF"
        - "#FDCB6C"
      bold: false
      italic: false
      strikethrough: false
      fields:
      - ga_sessions.goal_conversion_rate
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 2163
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Custom
        colors:
        - "#FFFFFF"
        - "#FDCB6C"
      bold: false
      italic: false
      strikethrough: false
      fields:
      - ga_sessions.goal_conversions
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 2181
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: circle
    y_axis_combined: false
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    query_timezone: America/Los_Angeles
    show_null_points: true
    interpolation: monotone
    series_types: {}
    y_axis_labels: []
    hidden_series:
    - ga_sessions.total_visitors
    - totals.transactionRevenue_total
    - totals.average_revenue_per_transaction
    y_axis_orientation:
    - left
    - right
    hidden_fields:
    series_colors:
      totals.transaction_conversion_rate: "#5EC0C4"
    y_axes:
    - label: ''
      orientation: bottom
      series:
      - id: ga_sessions.total_visitors
        name: Users
        axisId: ga_sessions.total_visitors
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 2100
      - id: totals.transactions_count
        name: Conversions
        axisId: totals.transactions_count
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 2105
      - id: totals.transactionRevenue_total
        name: Total Value
        axisId: totals.transactionRevenue_total
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 2110
      - id: totals.average_revenue_per_transaction
        name: Average Revenue per Transaction
        axisId: totals.average_revenue_per_transaction
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 2115
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 2097
    - label:
      orientation: bottom
      series:
      - id: totals.transaction_conversion_rate
        name: Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 2134
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 2131
    colors:
    - "#B9E49A"
    - "#FF666C"
    - "#58A9F5"
    - "#FDCB6C"
    - "#F6659A"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time User: ga_sessions.first_time_visitor
    row: 29
    col: 0
    width: 11
    height: 12
  - title: Conversions Over Time
    name: Conversions Over Time
    model: event_analytics
    explore: ga_sessions
    type: looker_line
    fields:
    - ga_sessions.visitStart_date
    - ga_sessions.unique_visitors
    - ga_sessions.percent_new_users
    - ga_sessions.goal_conversions
    - ga_sessions.goal_conversion_rate
    fill_fields:
    - ga_sessions.visitStart_date
    filters:
      trafficSource.keyword: "-NULL"
      ga_sessions.date_period_latest: 'Yes'
    sorts:
    - ga_sessions.visitStart_date desc
    limit: 14
    column_limit: 50
    stacking: ''
    colors:
    - "#B9E49A"
    - "#FF666C"
    - "#58A9F5"
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
    label_color: []
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_colors:
      ga_sessions.goal_conversions: "#FF666C"
      ga_sessions.goal_conversion_rate: "#58A9F5"
      ga_sessions.unique_visitors: "#fdcb6c"
      ga_sessions.percent_new_users: "#BFBFBF"
    series_labels:
      totals.transactions_count: Conversions
      ga_sessions.total_visitors: Users
      totals.average_revenue_per_transaction: Avg Conversion Value
      percent_of_visitors_w_transactions: "% Converting Users"
      ga_sessions.unique_visitors: Users
    series_types: {}
    limit_displayed_rows: false
    hidden_series:
    - ga_sessions.percent_new_users
    - ga_sessions.goal_conversions
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.unique_visitors
        name: Unique Users
        axisId: ga_sessions.unique_visitors
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
    - label:
      orientation: left
      series:
      - id: ga_sessions.goal_conversions
        name: Goal Conversions
        axisId: ga_sessions.goal_conversions
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.percent_new_users
        name: Percent New Users
        axisId: ga_sessions.percent_new_users
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.goal_conversion_rate
        name: Goal Conversion Rate
        axisId: ga_sessions.goal_conversion_rate
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
    y_axis_combined: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_labels: []
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    y_axis_orientation:
    - left
    - right
    show_null_points: true
    interpolation: monotone
    query_timezone: America/Los_Angeles
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    hidden_fields:
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time User: ga_sessions.first_time_visitor
    row: 3
    col: 0
    width: 24
    height: 9
  - title: Returning Users
    name: Returning Users
    model: event_analytics
    explore: ga_sessions
    type: single_value
    fields:
    - ga_sessions.date_period
    - ga_sessions.goal_conversions
    filters:
      geoNetwork.country: ''
      ga_sessions.date_period_comparison_period: 'Yes'
      ga_sessions.visitnumber: not 1
      ga_sessions.period: 7 day
      trafficSource.campaign: ''
      ga_sessions.first_time_visitor: ''
    sorts:
    - ga_sessions.date_period desc
    limit: 2
    column_limit: 50
    dynamic_fields:
    - table_calculation: goal_conversions
      label: Goal Conversions
      expression: "(${ga_sessions.goal_conversions} - offset(${ga_sessions.goal_conversions},\
        \ 1)) / offset(${ga_sessions.goal_conversions}, 1)"
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
        name: Users
        axisId: ga_sessions.unique_visitors
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 598
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 595
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Users
        axisId: ga_sessions.returning_visitors
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 614
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 611
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 630
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 627
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 646
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 643
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 662
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 659
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 677
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 674
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
    - bounce_rate
    - sessions
    - avg_duration
    - users
    - returning_users
    listen: {}
    row: 0
    col: 16
    width: 4
    height: 3
  - title: Returning User Conv Rate
    name: Returning User Conv Rate
    model: event_analytics
    explore: ga_sessions
    type: single_value
    fields:
    - ga_sessions.date_period
    - ga_sessions.goal_conversion_rate
    filters:
      geoNetwork.country: ''
      ga_sessions.date_period_comparison_period: 'Yes'
      ga_sessions.visitnumber: not 1
      ga_sessions.period: 7 day
      trafficSource.campaign: ''
      ga_sessions.first_time_visitor: ''
    sorts:
    - ga_sessions.date_period desc
    limit: 2
    column_limit: 50
    dynamic_fields:
    - table_calculation: goal_conversions
      label: Goal Conversions
      expression: "(${ga_sessions.goal_conversion_rate} - offset(${ga_sessions.goal_conversion_rate},\
        \ 1)) / offset(${ga_sessions.goal_conversion_rate}, 1)"
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
        name: Users
        axisId: ga_sessions.unique_visitors
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 598
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 595
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Users
        axisId: ga_sessions.returning_visitors
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 614
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 611
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 630
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 627
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 646
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 643
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 662
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 659
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 677
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 674
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
    - bounce_rate
    - sessions
    - avg_duration
    - users
    - returning_users
    listen: {}
    row: 0
    col: 20
    width: 4
    height: 3
  - title: New Users Conv Rate
    name: New Users Conv Rate
    model: event_analytics
    explore: ga_sessions
    type: single_value
    fields:
    - ga_sessions.date_period
    - ga_sessions.goal_conversion_rate
    filters:
      geoNetwork.country: ''
      ga_sessions.date_period_comparison_period: 'Yes'
      ga_sessions.visitnumber: '1'
      ga_sessions.period: 7 day
      trafficSource.campaign: ''
      ga_sessions.first_time_visitor: ''
    sorts:
    - ga_sessions.date_period desc
    limit: 2
    column_limit: 50
    dynamic_fields:
    - table_calculation: goal_conversions
      label: Goal Conversions
      expression: "(${ga_sessions.goal_conversion_rate} - offset(${ga_sessions.goal_conversion_rate},\
        \ 1)) / offset(${ga_sessions.goal_conversion_rate}, 1)"
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
        name: Users
        axisId: ga_sessions.unique_visitors
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 598
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 595
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Users
        axisId: ga_sessions.returning_visitors
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 614
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 611
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 630
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 627
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 646
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 643
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 662
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 659
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 677
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 674
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
    - bounce_rate
    - sessions
    - avg_duration
    - users
    - returning_users
    listen: {}
    row: 0
    col: 12
    width: 4
    height: 3
  - title: New Users Conv
    name: New Users Conv
    model: event_analytics
    explore: ga_sessions
    type: single_value
    fields:
    - ga_sessions.date_period
    - ga_sessions.goal_conversions
    filters:
      geoNetwork.country: ''
      ga_sessions.date_period_comparison_period: 'Yes'
      ga_sessions.visitnumber: '1'
    sorts:
    - ga_sessions.date_period desc
    limit: 2
    column_limit: 50
    dynamic_fields:
    - table_calculation: goal_conversions
      label: Goal Conversions
      expression: "(${ga_sessions.goal_conversions} - offset(${ga_sessions.goal_conversions},\
        \ 1)) / offset(${ga_sessions.goal_conversions}, 1)"
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
        name: Users
        axisId: ga_sessions.unique_visitors
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 598
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 595
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Users
        axisId: ga_sessions.returning_visitors
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 614
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 611
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 630
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 627
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 646
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 643
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 662
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 659
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: app_event_analytics/conversions.dashboard.lookml
        __LINE_NUM: 677
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: app_event_analytics/conversions.dashboard.lookml
      __LINE_NUM: 674
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
    - bounce_rate
    - sessions
    - avg_duration
    - users
    - returning_users
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time User: ga_sessions.first_time_visitor
    row: 0
    col: 8
    width: 4
    height: 3
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
  - name: First Time User
    title: First Time User
    type: string_filter
    default_value: ''
    allow_multiple_values: true
    required: false
  - name: Property
    title: Property
    type: string_filter
    default_value: All Websites
    allow_multiple_values: true
    required: false

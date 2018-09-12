- dashboard: conversions
  title: Conversions
  extends: event_analytics_dash_base
  layout: newspaper
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 364
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 361
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Users
        axisId: ga_sessions.returning_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 380
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 377
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 396
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 393
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 412
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 409
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 428
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 425
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 443
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 440
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
      Property: ga_sessions.property
      Campaign: trafficSource.campaign
      First Time User: ga_sessions.first_time_visitor
      Goal Selection: ga_sessions.goal_selection
      Host: ga_sessions.has_host
      Search Keyword: trafficSource.keyword
      Country: geoNetwork.country
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
    - ga_sessions.selected_goal_conversions
    filters:
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
      expression: "(${ga_sessions.selected_goal_conversions} - offset(${ga_sessions.selected_goal_conversions},\
        \ 1)) / offset(${ga_sessions.selected_goal_conversions}, 1)"
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 127
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 124
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Users
        axisId: ga_sessions.returning_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 143
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 140
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 159
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 156
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 175
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 172
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 191
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 188
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 206
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
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
      Property: ga_sessions.property
      Campaign: trafficSource.campaign
      First Time User: ga_sessions.first_time_visitor
      Goal Selection: ga_sessions.goal_selection
      Host: ga_sessions.has_host
      Search Keyword: trafficSource.keyword
      Country: geoNetwork.country
    row: 0
    col: 4
    width: 4
    height: 3
  - title: New Users Conv
    name: New Users Conv
    model: event_analytics
    explore: ga_sessions
    type: single_value
    fields:
    - ga_sessions.date_period
    - ga_sessions.selected_goal_conversions
    filters:
      ga_sessions.date_period_comparison_period: 'Yes'
      ga_sessions.visitnumber: '1'
    sorts:
    - ga_sessions.date_period desc
    limit: 2
    column_limit: 50
    dynamic_fields:
    - table_calculation: goal_conversions
      label: Goal Conversions
      expression: "(${ga_sessions.selected_goal_conversions} - offset(${ga_sessions.selected_goal_conversions},\
        \ 1)) / offset(${ga_sessions.selected_goal_conversions}, 1)"
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 736
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 733
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Users
        axisId: ga_sessions.returning_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 752
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 749
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 768
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 765
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 784
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 781
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 800
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 797
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 815
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 812
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
      Property: ga_sessions.property
      Campaign: trafficSource.campaign
      First Time User: ga_sessions.first_time_visitor
      Goal Selection: ga_sessions.goal_selection
      Host: ga_sessions.has_host
      Search Keyword: trafficSource.keyword
      Country: geoNetwork.country
    row: 0
    col: 8
    width: 4
    height: 3
  - title: New Users Conv Rate
    name: New Users Conv Rate
    model: event_analytics
    explore: ga_sessions
    type: single_value
    fields:
    - ga_sessions.date_period
    - ga_sessions.selected_goal_conversion_rate
    filters:
      ga_sessions.date_period_comparison_period: 'Yes'
      ga_sessions.visitnumber: '1'
    sorts:
    - ga_sessions.date_period desc
    limit: 2
    column_limit: 50
    dynamic_fields:
    - table_calculation: goal_conversions
      label: Goal Conversions
      expression: "(${ga_sessions.selected_goal_conversion_rate} - offset(${ga_sessions.selected_goal_conversion_rate},\
        \ 1)) / offset(${ga_sessions.selected_goal_conversion_rate}, 1)"
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 552
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 549
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Users
        axisId: ga_sessions.returning_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 568
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 565
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 584
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 581
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 600
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 597
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 616
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 613
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 631
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 628
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
      Property: ga_sessions.property
      Campaign: trafficSource.campaign
      First Time User: ga_sessions.first_time_visitor
      Goal Selection: ga_sessions.goal_selection
      Host: ga_sessions.has_host
      Search Keyword: trafficSource.keyword
      Country: geoNetwork.country
    row: 0
    col: 12
    width: 4
    height: 3
  - title: Returning Users
    name: Returning Users
    model: event_analytics
    explore: ga_sessions
    type: single_value
    fields:
    - ga_sessions.date_period
    - ga_sessions.selected_goal_conversions
    filters:
      ga_sessions.date_period_comparison_period: 'Yes'
      ga_sessions.visitnumber: not 1
    sorts:
    - ga_sessions.date_period desc
    limit: 2
    column_limit: 50
    dynamic_fields:
    - table_calculation: goal_conversions
      label: Goal Conversions
      expression: "(${ga_sessions.selected_goal_conversions} - offset(${ga_sessions.selected_goal_conversions},\
        \ 1)) / offset(${ga_sessions.selected_goal_conversions}, 1)"
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 920
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 917
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Users
        axisId: ga_sessions.returning_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 936
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 933
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 952
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 949
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 968
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 965
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 984
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 981
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 999
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 996
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
      Property: ga_sessions.property
      Campaign: trafficSource.campaign
      First Time User: ga_sessions.first_time_visitor
      Goal Selection: ga_sessions.goal_selection
      Host: ga_sessions.has_host
      Search Keyword: trafficSource.keyword
      Country: geoNetwork.country
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
    - ga_sessions.selected_goal_conversion_rate
    filters:
      ga_sessions.date_period_comparison_period: 'Yes'
      ga_sessions.visitnumber: not 1
    sorts:
    - ga_sessions.date_period desc
    limit: 2
    column_limit: 50
    dynamic_fields:
    - table_calculation: goal_conversions
      label: Goal Conversions
      expression: "(${ga_sessions.selected_goal_conversion_rate} - offset(${ga_sessions.selected_goal_conversion_rate},\
        \ 1)) / offset(${ga_sessions.selected_goal_conversion_rate}, 1)"
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 1104
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 1101
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Users
        axisId: ga_sessions.returning_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 1120
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 1117
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 1136
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 1133
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 1152
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 1149
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 1168
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 1165
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 1183
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 1180
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
      Property: ga_sessions.property
      Campaign: trafficSource.campaign
      First Time User: ga_sessions.first_time_visitor
      Goal Selection: ga_sessions.goal_selection
      Host: ga_sessions.has_host
      Search Keyword: trafficSource.keyword
      Country: geoNetwork.country
    row: 0
    col: 20
    width: 4
    height: 3
  - title: Top Medium
    name: Top Medium
    model: event_analytics
    explore: ga_sessions
    type: looker_bar
    fields:
    - trafficSource.medium
    - ga_sessions.selected_goal_conversion_rate
    - ga_sessions.selected_goal_conversions
    - ga_sessions.total_visitors
    filters:
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
      ga_sessions.selected_goal_conversion_rate: "#58A9F5"
    series_labels:
      ga_sessions.total_visitors: Users
      totals.transactions_count: Conversions
      totals.transactionRevenue_total: Total Value
      percent_of_visitors_w_transactions: "% Converting Users"
      totals.transaction_conversion_rate: Conversion Rate
      ga_sessions.selected_goal_conversion_rate: Goal Conversion Rate
      ga_sessions.selected_goal_conversions: Goal Conversions
    series_types:
      ga_sessions.selected_goal_conversion_rate: line
      ga_sessions.selected_goal_conversions: line
    limit_displayed_rows: false
    hidden_series:
    - ga_sessions.selected_goal_conversions
    y_axes:
    - label: ''
      orientation: bottom
      series:
      - id: ga_sessions.total_visitors
        name: Users
        axisId: ga_sessions.total_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 1296
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 1293
    - label:
      orientation: bottom
      series:
      - id: ga_sessions.selected_goal_conversions
        name: Goal Conversions
        axisId: ga_sessions.selected_goal_conversions
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 1315
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 1312
    - label:
      orientation: bottom
      series:
      - id: ga_sessions.selected_goal_conversion_rate
        name: Goal Conversion Rate
        axisId: ga_sessions.selected_goal_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 1334
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 1331
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
      Property: ga_sessions.property
      Campaign: trafficSource.campaign
      First Time User: ga_sessions.first_time_visitor
      Goal Selection: ga_sessions.goal_selection
      Host: ga_sessions.has_host
      Search Keyword: trafficSource.keyword
      Country: geoNetwork.country
    row: 12
    col: 0
    width: 8
    height: 10
  - title: Top Channels
    name: Top Channels
    model: event_analytics
    explore: ga_sessions
    type: looker_bar
    fields:
    - ga_sessions.channelGrouping
    - ga_sessions.selected_goal_conversion_rate
    - ga_sessions.selected_goal_conversions
    - ga_sessions.total_visitors
    filters:
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
      ga_sessions.selected_goal_conversion_rate: "#58A9F5"
    series_labels:
      ga_sessions.total_visitors: Users
      totals.transactions_count: Conversions
      totals.transactionRevenue_total: Total Value
      percent_of_visitors_w_transactions: "% Converting Users"
      totals.transaction_conversion_rate: Conversion Rate
      ga_sessions.selected_goal_conversion_rate: Goal Conversion Rate
      ga_sessions.selected_goal_conversions: Goal Conversions
    series_types:
      ga_sessions.selected_goal_conversion_rate: line
      ga_sessions.selected_goal_conversions: line
    limit_displayed_rows: false
    hidden_series:
    - ga_sessions.selected_goal_conversions
    y_axes:
    - label: ''
      orientation: bottom
      series:
      - id: ga_sessions.total_visitors
        name: Users
        axisId: ga_sessions.total_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 1752
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 1749
    - label:
      orientation: bottom
      series:
      - id: ga_sessions.selected_goal_conversions
        name: Goal Conversions
        axisId: ga_sessions.selected_goal_conversions
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 1771
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 1768
    - label:
      orientation: bottom
      series:
      - id: ga_sessions.selected_goal_conversion_rate
        name: Goal Conversion Rate
        axisId: ga_sessions.selected_goal_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 1790
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 1787
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
      Property: ga_sessions.property
      Campaign: trafficSource.campaign
      First Time User: ga_sessions.first_time_visitor
      Goal Selection: ga_sessions.goal_selection
      Host: ga_sessions.has_host
      Search Keyword: trafficSource.keyword
      Country: geoNetwork.country
    row: 12
    col: 16
    width: 8
    height: 10
  - title: Conversions Over Time
    name: Conversions Over Time
    model: event_analytics
    explore: ga_sessions
    type: looker_line
    fields:
    - ga_sessions.visitStart_date
    - ga_sessions.unique_visitors
    - ga_sessions.percent_new_users
    - ga_sessions.selected_goal_conversions
    - ga_sessions.selected_goal_conversion_rate
    fill_fields:
    - ga_sessions.visitStart_date
    filters:
      ga_sessions.date_period_latest: 'Yes'
      ga_sessions.has_page: ''
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
      ga_sessions.selected_goal_conversions: "#FF666C"
      ga_sessions.selected_goal_conversion_rate: "#58A9F5"
      ga_sessions.unique_visitors: "#fdcb6c"
      ga_sessions.percent_new_users: "#BFBFBF"
    series_labels:
      totals.transactions_count: Conversions
      ga_sessions.total_visitors: Users
      totals.average_revenue_per_transaction: Avg Conversion Value
      percent_of_visitors_w_transactions: "% Converting Users"
      ga_sessions.unique_visitors: Users
      ga_sessions.selected_goal_conversion_rate: Goal Conversion Rate
      ga_sessions.selected_goal_conversions: Goal Conversions
    series_types: {}
    limit_displayed_rows: false
    hidden_series:
    - ga_sessions.percent_new_users
    - ga_sessions.selected_goal_conversions
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.unique_visitors
        name: Unique Users
        axisId: ga_sessions.unique_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 1451
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 1448
    - label:
      orientation: left
      series:
      - id: ga_sessions.selected_goal_conversions
        name: Goal Conversions
        axisId: ga_sessions.selected_goal_conversions
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 1466
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 1463
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.percent_new_users
        name: Percent New Users
        axisId: ga_sessions.percent_new_users
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 1481
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 1478
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.selected_goal_conversion_rate
        name: Goal Conversion Rate
        axisId: ga_sessions.selected_goal_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 1496
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 1493
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
      Property: ga_sessions.property
      Campaign: trafficSource.campaign
      First Time User: ga_sessions.first_time_visitor
      Goal Selection: ga_sessions.goal_selection
      Host: ga_sessions.has_host
      Search Keyword: trafficSource.keyword
      Country: geoNetwork.country
    row: 3
    col: 0
    width: 24
    height: 9
  - title: Top Referrers
    name: Top Referrers
    model: event_analytics
    explore: ga_sessions
    type: looker_bar
    fields:
    - trafficSource.source
    - ga_sessions.selected_goal_conversion_rate
    - ga_sessions.selected_goal_conversions
    - ga_sessions.total_visitors
    filters:
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
      ga_sessions.selected_goal_conversion_rate: "#58A9F5"
    series_labels:
      ga_sessions.total_visitors: Users
      totals.transactions_count: Conversions
      totals.transactionRevenue_total: Total Value
      percent_of_visitors_w_transactions: "% Converting Users"
      totals.transaction_conversion_rate: Conversion Rate
      ga_sessions.selected_goal_conversion_rate: Goal Conversion Rate
      ga_sessions.selected_goal_conversions: Goal Conversions
    series_types:
      ga_sessions.selected_goal_conversion_rate: line
      ga_sessions.selected_goal_conversions: line
    limit_displayed_rows: false
    hidden_series:
    - ga_sessions.selected_goal_conversions
    y_axes:
    - label: ''
      orientation: bottom
      series:
      - id: ga_sessions.total_visitors
        name: Users
        axisId: ga_sessions.total_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 1603
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 1600
    - label:
      orientation: bottom
      series:
      - id: ga_sessions.selected_goal_conversions
        name: Goal Conversions
        axisId: ga_sessions.selected_goal_conversions
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 1622
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 1619
    - label:
      orientation: bottom
      series:
      - id: ga_sessions.selected_goal_conversion_rate
        name: Goal Conversion Rate
        axisId: ga_sessions.selected_goal_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 1641
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 1638
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
      Property: ga_sessions.property
      Campaign: trafficSource.campaign
      First Time User: ga_sessions.first_time_visitor
      Goal Selection: ga_sessions.goal_selection
      Host: ga_sessions.has_host
      Search Keyword: trafficSource.keyword
      Country: geoNetwork.country
    row: 12
    col: 8
    width: 8
    height: 10
  - title: Conversions by Geo
    name: Conversions by Geo
    model: event_analytics
    explore: ga_sessions
    type: looker_map
    fields:
    - geoNetwork.country
    - ga_sessions.selected_goal_conversions
    filters:
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 1923
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 1920
    - label:
      orientation: top
      series:
      - id: average_transaction_revenue
        name: Average Transaction Revenue
        axisId: average_transaction_revenue
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 1942
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 1939
    - label: ''
      orientation: bottom
      series:
      - id: percent_of_visitors_w_transactions
        name: Percent of Users w/ Transactions
        axisId: percent_of_visitors_w_transactions
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 1961
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 1958
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
      Property: ga_sessions.property
      Campaign: trafficSource.campaign
      First Time User: ga_sessions.first_time_visitor
      Goal Selection: ga_sessions.goal_selection
      Host: ga_sessions.has_host
      Search Keyword: trafficSource.keyword
      Country: geoNetwork.country
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
    - ga_sessions.selected_goal_conversions
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 2073
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 2070
    - label:
      orientation: top
      series:
      - id: average_transaction_revenue
        name: Average Transaction Revenue
        axisId: average_transaction_revenue
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 2092
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 2089
    - label: ''
      orientation: bottom
      series:
      - id: percent_of_visitors_w_transactions
        name: Percent of Users w/ Transactions
        axisId: percent_of_visitors_w_transactions
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 2111
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 2108
    listen:
      Period: ga_sessions.period
      Property: ga_sessions.property
      Campaign: trafficSource.campaign
      First Time User: ga_sessions.first_time_visitor
      Goal Selection: ga_sessions.goal_selection
      Host: ga_sessions.has_host
      Search Keyword: trafficSource.keyword
      Country: geoNetwork.country
    row: 22
    col: 16
    width: 8
    height: 7
  - title: Top Converting Keywords
    name: Top Converting Keywords
    model: event_analytics
    explore: ga_sessions
    type: table
    fields:
    - trafficSource.keyword
    - ga_sessions.selected_goal_conversion_rate
    - ga_sessions.selected_goal_conversions
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
      ga_sessions.selected_goal_conversion_rate: Goal Conversion Rate
      ga_sessions.selected_goal_conversions: Goal Conversions
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 2177
      bold: false
      italic: false
      strikethrough: false
      fields:
      - ga_sessions.selected_goal_conversion_rate
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 2172
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Custom
        colors:
        - "#FFFFFF"
        - "#FDCB6C"
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 2195
      bold: false
      italic: false
      strikethrough: false
      fields:
      - ga_sessions.selected_goal_conversions
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 2190
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 2252
      - id: totals.transactions_count
        name: Conversions
        axisId: totals.transactions_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 2257
      - id: totals.transactionRevenue_total
        name: Total Value
        axisId: totals.transactionRevenue_total
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 2262
      - id: totals.average_revenue_per_transaction
        name: Average Revenue per Transaction
        axisId: totals.average_revenue_per_transaction
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 2267
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 2249
    - label:
      orientation: bottom
      series:
      - id: totals.transaction_conversion_rate
        name: Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 2286
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 2283
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
      Property: ga_sessions.property
      Campaign: trafficSource.campaign
      First Time User: ga_sessions.first_time_visitor
      Goal Selection: ga_sessions.goal_selection
      Host: ga_sessions.has_host
      Search Keyword: trafficSource.keyword
      Country: geoNetwork.country
    row: 29
    col: 0
    width: 11
    height: 12
  - title: Top Converting Landing Pages
    name: Top Converting Landing Pages
    model: event_analytics
    explore: ga_sessions
    type: table
    fields:
    - first_page.pageTitle
    - ga_sessions.selected_goal_conversion_rate
    - ga_sessions.selected_goal_conversions
    - ga_sessions.unique_visitors
    filters:
      ga_sessions.date_period_latest: 'Yes'
    sorts:
    - ga_sessions.selected_goal_conversions desc
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
      ga_sessions.selected_goal_conversion_rate: Goal Conversion Rate
      ga_sessions.selected_goal_conversions: Goal Conversions
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 2364
      bold: false
      italic: false
      strikethrough: false
      fields:
      - ga_sessions.selected_goal_conversions
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 2359
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Custom
        colors:
        - "#FFFFFF"
        - "#FDCB6C"
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 2382
      bold: false
      italic: false
      strikethrough: false
      fields:
      - ga_sessions.selected_goal_conversion_rate
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 2377
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 2439
      - id: totals.transactions_count
        name: Conversions
        axisId: totals.transactions_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 2444
      - id: totals.transactionRevenue_total
        name: Total Value
        axisId: totals.transactionRevenue_total
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 2449
      - id: totals.average_revenue_per_transaction
        name: Average Revenue per Transaction
        axisId: totals.average_revenue_per_transaction
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 2454
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 2436
    - label:
      orientation: bottom
      series:
      - id: totals.transaction_conversion_rate
        name: Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
        __LINE_NUM: 2473
      showLabels: false
      showValues: false
      maxValue:
      minValue:
      valueFormat:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/conversions.dashboard.lookml
      __LINE_NUM: 2470
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
      Property: ga_sessions.property
      Campaign: trafficSource.campaign
      First Time User: ga_sessions.first_time_visitor
      Goal Selection: ga_sessions.goal_selection
      Host: ga_sessions.has_host
      Search Keyword: trafficSource.keyword
      Country: geoNetwork.country
    row: 29
    col: 11
    width: 13
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

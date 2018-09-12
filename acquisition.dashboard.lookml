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
        name: Unique Visitors
        axisId: ga_sessions.unique_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 127
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 124
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Visitors
        axisId: ga_sessions.returning_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 143
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 140
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 159
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 156
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 175
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 172
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 191
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 188
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 206
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
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
    row: 0
    col: 0
    width: 4
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 838
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 835
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Users
        axisId: ga_sessions.returning_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 854
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 851
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 870
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 867
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 886
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 883
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Users
        axisId: percent_new_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 902
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 899
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 917
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 914
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
    row: 0
    col: 7
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
        name: Unique Visitors
        axisId: ga_sessions.unique_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 361
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 358
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Visitors
        axisId: ga_sessions.returning_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 377
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 374
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 393
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 390
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 409
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 406
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 425
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 422
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 440
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 437
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
    row: 0
    col: 4
    width: 3
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 595
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 592
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Visitors
        axisId: ga_sessions.returning_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 611
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 608
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 627
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 624
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 643
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 640
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 659
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 656
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 674
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 671
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
        name: Unique Visitors
        axisId: ga_sessions.unique_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 2029
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 2026
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Visitors
        axisId: ga_sessions.returning_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 2045
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 2042
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 2061
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 2058
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 2077
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 2074
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 2093
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 2090
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 2108
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 2105
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
        name: Unique Visitors
        axisId: ga_sessions.unique_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 1496
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 1493
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Visitors
        axisId: ga_sessions.returning_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 1512
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 1509
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 1528
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 1525
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 1544
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 1541
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 1560
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 1557
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 1575
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 1572
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
    row: 0
    col: 17
    width: 3
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
    filters:
      ga_sessions.date_period_comparison_period: 'Yes'
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 1024
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 1021
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Users
        axisId: ga_sessions.returning_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 1040
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 1037
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Avg Session Duration
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 1056
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 1053
    - label: ''
      orientation: left
      series:
      - id: totals.bounce_rate
        name: Bounce Rate
        axisId: totals.bounce_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 1072
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 1069
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.percent_new_users
        name: Percent New Users
        axisId: ga_sessions.percent_new_users
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 1087
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 1084
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.selected_goal_conversion_rate
        name: Goal Conversion Rate
        axisId: ga_sessions.selected_goal_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 1102
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 1099
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
    row: 2
    col: 0
    width: 24
    height: 7
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 1260
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 1257
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Visitors
        axisId: ga_sessions.returning_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 1276
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 1273
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 1292
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 1289
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 1308
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 1305
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 1324
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 1321
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 1339
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 1336
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
    row: 0
    col: 20
    width: 4
    height: 2
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
    filters:
      ga_sessions.date_period_comparison_period: 'Yes'
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 1686
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 1683
    - label: ''
      orientation: bottom
      series:
      - id: ga_sessions.percent_new_users
        name: Percent New Users
        axisId: ga_sessions.percent_new_users
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 1702
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 1699
    - label: ''
      orientation: bottom
      series:
      - id: ga_sessions.selected_goal_conversion_rate
        name: Goal Conversion Rate
        axisId: ga_sessions.selected_goal_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 1717
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 1714
    - label: ''
      orientation: bottom
      series:
      - id: totals.timeonsite_average_per_session
        name: Avg Session Duration
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 1732
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 1729
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
    filters:
      ga_sessions.date_period_comparison_period: 'Yes'
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 1835
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 1832
    - label: ''
      orientation: bottom
      series:
      - id: ga_sessions.percent_new_users
        name: Percent New Users
        axisId: ga_sessions.percent_new_users
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 1851
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 1848
    - label: ''
      orientation: bottom
      series:
      - id: ga_sessions.selected_goal_conversion_rate
        name: Goal Conversion Rate
        axisId: ga_sessions.selected_goal_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 1866
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 1863
    - label: ''
      orientation: bottom
      series:
      - id: totals.timeonsite_average_per_session
        name: Avg Session Duration
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 1881
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 1878
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
    row: 11
    col: 8
    width: 8
    height: 13
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
      ga_sessions.date_period_comparison_period: 'Yes'
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 2227
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 2224
    - label:
      orientation: bottom
      series:
      - id: ga_sessions.percent_new_users
        name: Percent New Users
        axisId: ga_sessions.percent_new_users
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 2243
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 2240
    - label: ''
      orientation: bottom
      series:
      - id: ga_sessions.selected_goal_conversion_rate
        name: Goal Conversion Rate
        axisId: ga_sessions.selected_goal_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 2259
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 2256
    - label: ''
      orientation: bottom
      series:
      - id: totals.timeonsite_average_per_session
        name: Avg Session Duration
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 2274
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 2271
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
    row: 11
    col: 16
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
    filters:
      ga_sessions.date_period_comparison_period: 'Yes'
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 2384
      bold: false
      italic: false
      strikethrough: false
      fields:
      - ga_sessions.session_count
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 2379
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
    row: 24
    col: 0
    width: 12
    height: 12
  - title: Users by Country
    name: Users by Country
    model: event_analytics
    explore: ga_sessions
    type: looker_map
    fields:
    - geoNetwork.country
    - ga_sessions.unique_visitors
    filters:
      ga_sessions.date_period_comparison_period: 'Yes'
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
    filters:
      ga_sessions.date_period_comparison_period: 'Yes'
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 2526
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: custom
      tickDensityCustom: 3
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 2523
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.percent_new_users
        name: Percent New Users
        axisId: ga_sessions.percent_new_users
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 2542
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 2539
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.selected_goal_conversion_rate
        name: Goal Conversion Rate
        axisId: ga_sessions.selected_goal_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 2557
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 2554
    - label: ''
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Avg Session Duration
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 2572
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 2569
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
    filters:
      ga_sessions.date_period_comparison_period: 'Yes'
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 3028
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 3025
    - label: ''
      orientation: left
      series:
      - id: totals.transaction_conversion_rate
        name: Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 3044
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 3041
    - label: ''
      orientation: left
      series:
      - id: totals.timeonsite_total
        name: Time On Site
        axisId: totals.timeonsite_total
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 3059
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 3056
    - label: ''
      orientation: right
      series:
      - id: new_users
        name: "% New Users"
        axisId: new_users
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 3074
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 3071
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
    filters:
      ga_sessions.date_period_comparison_period: 'Yes'
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 2677
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 2674
    - label: ''
      orientation: bottom
      series:
      - id: ga_sessions.percent_new_users
        name: Percent New Users
        axisId: ga_sessions.percent_new_users
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 2693
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 2690
    - label: ''
      orientation: bottom
      series:
      - id: ga_sessions.selected_goal_conversion_rate
        name: Goal Conversion Rate
        axisId: ga_sessions.selected_goal_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 2708
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 2705
    - label: ''
      orientation: bottom
      series:
      - id: totals.timeonsite_average_per_session
        name: Avg Session Duration
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 2723
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 2720
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
    filters:
      ga_sessions.date_period_comparison_period: 'Yes'
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 2809
      bold: false
      italic: false
      strikethrough: false
      fields:
      - ga_sessions.session_count
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 2804
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Custom
        colors:
        - "#FFFFFF"
        - "#58A9F5"
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 2827
      bold: false
      italic: false
      strikethrough: false
      fields:
      - ga_sessions.percent_new_users
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 2822
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Custom
        colors:
        - "#FFFFFF"
        - "#58A9F5"
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 2845
      bold: false
      italic: false
      strikethrough: false
      fields:
      - totals.timeonsite_average_per_session
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 2840
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Custom
        colors:
        - "#FFFFFF"
        - "#58A9F5"
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 2863
      bold: false
      italic: false
      strikethrough: false
      fields:
      - ga_sessions.selected_goal_conversion_rate
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 2858
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 2908
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 2905
    - label:
      orientation: bottom
      series:
      - id: ga_sessions.unique_visitors
        name: Unique Visitors
        axisId: ga_sessions.unique_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 2924
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: custom
      tickDensityCustom: 3
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 2921
    - label: ''
      orientation: bottom
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
        __LINE_NUM: 2940
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/acquisition.dashboard.lookml
      __LINE_NUM: 2937
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

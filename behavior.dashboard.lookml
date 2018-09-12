- dashboard: behavior
  title: Behavior
  extends: event_analytics_dash_base
  layout: newspaper
  embed_style:
    background_color: "#ffffff"
    title_color: "#3a4245"
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - title: Cohort / Retention Chart
    name: Cohort / Retention Chart
    model: event_analytics
    explore: cohort
    type: table
    fields:
    - cohort.first_start_week
    - cohort.weeks_active
    - cohort.selected_measure
    pivots:
    - cohort.weeks_active
    fill_fields:
    - cohort.first_start_week
    filters:
      cohort.measure_picker: Sessions
      cohort.period: 91 day
      cohort.date_period_latest: 'Yes'
    sorts:
    - cohort.first_start_week
    - cohort.weeks_active 0
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
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
        - "#5EC0C4"
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 42
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 37
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 25
    col: 0
    width: 24
    height: 9
  - name: Where do I acquire users for engagement?
    type: text
    title_text: Where do I acquire users for engagement?
    row: 11
    col: 0
    width: 24
    height: 2
  - name: How often are our users coming back?
    type: text
    title_text: How often are our users coming back?
    row: 23
    col: 0
    width: 24
    height: 2
  - name: What content is driving the most engagement?
    type: text
    title_text: What content is driving the most engagement?
    row: 42
    col: 0
    width: 24
    height: 2
  - title: Avg Time on Site
    name: Avg Time on Site
    model: event_analytics
    explore: ga_sessions
    type: single_value
    fields:
    - ga_sessions.date_period
    - ga_sessions.session_count
    - ga_sessions.unique_visitors
    - totals.bounce_rate
    - totals.timeonsite_total
    - totals.timeonsite_average_per_session
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
    - table_calculation: users
      label: Users
      expression: "(${ga_sessions.unique_visitors} - offset(${ga_sessions.unique_visitors},\
        \ 1)) / offset(${ga_sessions.unique_visitors}, 1)"
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
    - table_calculation: time_on_site
      label: Time On Site
      expression: "(${totals.timeonsite_total} - offset(${totals.timeonsite_total},\
        \ 1)) / offset(${totals.timeonsite_total}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: avg_session_duration
      label: Avg Session Duration
      expression: "(${totals.timeonsite_average_per_session} - offset(${totals.timeonsite_average_per_session},\
        \ 1)) / offset(${totals.timeonsite_average_per_session}, 1)"
      value_format:
      value_format_name:
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 645
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 642
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Users
        axisId: ga_sessions.returning_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 661
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 658
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 677
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 674
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 693
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 690
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Users
        axisId: percent_new_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 709
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 706
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 724
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 721
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
    - avg_duration
    - ga_sessions.unique_visitors
    - users
    - conversion_rate
    - bounce_rate
    - totals.bounce_rate
    - returning_users
    - new_visitors
    - totals.timeonsite_total
    listen:
      Property: ga_sessions.property
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First TIme Visitor: ga_sessions.first_time_visitor
      Host: ga_sessions.has_host
      Search Keyword: trafficSource.keyword
      Goal Selection: ga_sessions.goal_selection
      Country: geoNetwork.country
    row: 0
    col: 14
    width: 5
    height: 3
  - title: Pageviews
    name: Pageviews
    model: event_analytics
    explore: ga_sessions
    type: single_value
    fields:
    - ga_sessions.date_period
    - ga_sessions.session_count
    - ga_sessions.unique_visitors
    - totals.bounce_rate
    - totals.newVisits_total
    - totals.pageviews_total
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
    - table_calculation: users
      label: Users
      expression: "(${ga_sessions.unique_visitors} - offset(${ga_sessions.unique_visitors},\
        \ 1)) / offset(${ga_sessions.unique_visitors}, 1)"
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
    - table_calculation: new_users
      label: New Users
      expression: "(${totals.newVisits_total} - offset(${totals.newVisits_total},\
        \ 1)) / offset(${totals.newVisits_total}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: page_views
      label: Page Views
      expression: "(${totals.pageviews_total} - offset(${totals.pageviews_total},\
        \ 1)) / offset(${totals.pageviews_total}, 1)"
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 870
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 867
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Users
        axisId: ga_sessions.returning_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 886
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 883
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 902
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 899
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 918
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 915
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Users
        axisId: percent_new_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 934
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 931
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 949
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 946
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
    - ga_sessions.unique_visitors
    - users
    - conversion_rate
    - bounce_rate
    - totals.bounce_rate
    - returning_users
    - totals.newVisits_total
    - new_visitors
    - page_views_per_session
    - new_users
    listen:
      Property: ga_sessions.property
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First TIme Visitor: ga_sessions.first_time_visitor
      Host: ga_sessions.has_host
      Search Keyword: trafficSource.keyword
      Goal Selection: ga_sessions.goal_selection
      Country: geoNetwork.country
    row: 0
    col: 5
    width: 5
    height: 3
  - title: Avg PVs per User
    name: Avg PVs per User
    model: event_analytics
    explore: ga_sessions
    type: single_value
    fields:
    - ga_sessions.date_period
    - ga_sessions.session_count
    - ga_sessions.unique_visitors
    - totals.bounce_rate
    - totals.newVisits_total
    - totals.pageviews_total
    - totals.avg_pageview_per_user
    filters:
      ga_sessions.date_period_comparison_period: 'Yes'
      ga_sessions.period: 7 day
      trafficSource.campaign: ''
      ga_sessions.first_time_visitor: ''
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
    - table_calculation: users
      label: Users
      expression: "(${ga_sessions.unique_visitors} - offset(${ga_sessions.unique_visitors},\
        \ 1)) / offset(${ga_sessions.unique_visitors}, 1)"
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
    - table_calculation: new_users
      label: New Users
      expression: "(${totals.newVisits_total} - offset(${totals.newVisits_total},\
        \ 1)) / offset(${totals.newVisits_total}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: page_views
      label: Page Views
      expression: "(${totals.pageviews_total} - offset(${totals.pageviews_total},\
        \ 1)) / offset(${totals.pageviews_total}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: avg_pvs_per_user
      label: Avg PVs per User
      expression: "(${totals.avg_pageview_per_user} - offset(${totals.avg_pageview_per_user},\
        \ 1)) / offset(${totals.avg_pageview_per_user}, 1)"
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 420
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 417
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Users
        axisId: ga_sessions.returning_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 436
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 433
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 452
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 449
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 468
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 465
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Users
        axisId: percent_new_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 484
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 481
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 499
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 496
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
    - ga_sessions.unique_visitors
    - users
    - conversion_rate
    - bounce_rate
    - totals.bounce_rate
    - returning_users
    - totals.newVisits_total
    - new_visitors
    - page_views_per_session
    - new_users
    - totals.pageviews_total
    - page_views
    listen:
      Property: ga_sessions.property
      Host: ga_sessions.has_host
      Search Keyword: trafficSource.keyword
      Goal Selection: ga_sessions.goal_selection
      Country: geoNetwork.country
    row: 0
    col: 10
    width: 4
    height: 3
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 184
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 181
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Users
        axisId: ga_sessions.returning_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 200
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 197
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 216
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 213
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 232
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 229
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Users
        axisId: percent_new_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 248
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 245
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 263
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 260
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
      Property: ga_sessions.property
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First TIme Visitor: ga_sessions.first_time_visitor
      Host: ga_sessions.has_host
      Search Keyword: trafficSource.keyword
      Goal Selection: ga_sessions.goal_selection
      Country: geoNetwork.country
    row: 0
    col: 0
    width: 5
    height: 3
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 1105
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 1102
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Users
        axisId: ga_sessions.returning_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 1121
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 1118
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 1137
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 1134
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 1153
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 1150
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Users
        axisId: percent_new_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 1169
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 1166
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 1184
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 1181
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
      Property: ga_sessions.property
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First TIme Visitor: ga_sessions.first_time_visitor
      Host: ga_sessions.has_host
      Search Keyword: trafficSource.keyword
      Goal Selection: ga_sessions.goal_selection
      Country: geoNetwork.country
    row: 0
    col: 19
    width: 5
    height: 3
  - title: Time Series
    name: Time Series
    model: event_analytics
    explore: ga_sessions
    type: looker_line
    fields:
    - ga_sessions.visitStart_date
    - ga_sessions.session_count
    - totals.pageviews_total
    - totals.timeonsite_total
    - totals.bounce_rate
    fill_fields:
    - ga_sessions.visitStart_date
    filters:
      ga_sessions.date_period_comparison_period: 'Yes'
    sorts:
    - ga_sessions.visitStart_date desc
    limit: 500
    column_limit: 50
    stacking: ''
    colors:
    - "#58A9F5"
    - "#FF666C"
    - "#B9E49A"
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
    point_style: circle
    series_colors:
      ga_sessions.session_count: "#5EC0C4"
      totals.pageviews_total: "#BFBFBF"
    series_labels:
      ga_sessions.unique_visitors: Users
      totals.page_views_session: Pages / Session
      ga_sessions.average_sessions_per_visitor: Sessions / User
      totals.timeonsite_average_per_session: Session Duration
    series_types: {}
    limit_displayed_rows: false
    hidden_series:
    - totals.pageviews_total
    - totals.timeonsite_total
    y_axes:
    - label:
      orientation: left
      series:
      - id: totals.bounce_rate
        name: Bounce Rate
        axisId: totals.bounce_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 1428
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 1425
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Sessions
        axisId: ga_sessions.session_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 1444
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 1441
    - label:
      orientation: left
      series:
      - id: totals.pageviews_total
        name: Page Views
        axisId: totals.pageviews_total
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 1460
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 1457
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_total
        name: Time On Site
        axisId: totals.timeonsite_total
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 1476
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 1473
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
    show_null_points: true
    interpolation: monotone
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Property: ga_sessions.property
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First TIme Visitor: ga_sessions.first_time_visitor
      Host: ga_sessions.has_host
      Search Keyword: trafficSource.keyword
      Goal Selection: ga_sessions.goal_selection
      Country: geoNetwork.country
    row: 3
    col: 0
    width: 24
    height: 8
  - title: Channel
    name: Channel
    model: event_analytics
    explore: ga_sessions
    type: looker_bar
    fields:
    - ga_sessions.channelGrouping
    - totals.timeonsite_average_per_session
    - totals.bounce_rate
    - totals.pageviews_total
    filters:
      ga_sessions.date_period_comparison_period: 'Yes'
    sorts:
    - totals.pageviews_total desc
    limit: 10
    column_limit: 50
    stacking: ''
    colors:
    - "#B9E49A"
    - "#FDCB6C"
    - "#58A9F5"
    - "#FF666C"
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
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_colors:
      total_sessions: "#58A9F5"
      average_time_per_session: "#FDCB6C"
      average_pageviews_per_session: "#FF666C"
      totals.pageviews_total: "#5EC0C4"
      totals.timeonsite_average_per_session: "#BFBFBF"
    series_types:
      average_time_spent_per_page: line
      average_pageviews_per_session: line
      average_time_per_session: line
      totals.timeonsite_total: line
      totals.bounce_rate: line
      totals.timeonsite_average_per_session: line
    limit_displayed_rows: false
    hidden_series:
    - totals.bounce_rate
    y_axes:
    - label: ''
      orientation: bottom
      series:
      - id: totals.pageviews_total
        name: Page Views
        axisId: totals.pageviews_total
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 1293
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 1290
    - label:
      orientation: bottom
      series:
      - id: totals.bounce_rate
        name: Bounce Rate
        axisId: totals.bounce_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 1308
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 1305
    - label: ''
      orientation: bottom
      series:
      - id: totals.timeonsite_average_per_session
        name: Avg Session Duration
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 1323
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 1320
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
    query_timezone: America/New_York
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields: []
    listen:
      Property: ga_sessions.property
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First TIme Visitor: ga_sessions.first_time_visitor
      Host: ga_sessions.has_host
      Search Keyword: trafficSource.keyword
      Goal Selection: ga_sessions.goal_selection
      Country: geoNetwork.country
    row: 13
    col: 0
    width: 6
    height: 10
  - title: Medium
    name: Medium
    model: event_analytics
    explore: ga_sessions
    type: looker_bar
    fields:
    - trafficSource.medium
    - totals.timeonsite_average_per_session
    - totals.bounce_rate
    - totals.pageviews_total
    filters:
      ga_sessions.date_period_comparison_period: 'Yes'
    sorts:
    - totals.pageviews_total desc
    limit: 10
    column_limit: 50
    stacking: ''
    colors:
    - "#B9E49A"
    - "#FDCB6C"
    - "#58A9F5"
    - "#FF666C"
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
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_colors:
      total_sessions: "#58A9F5"
      average_time_per_session: "#FDCB6C"
      average_pageviews_per_session: "#FF666C"
      totals.pageviews_total: "#5EC0C4"
      totals.timeonsite_average_per_session: "#BFBFBF"
    series_types:
      average_time_spent_per_page: line
      average_pageviews_per_session: line
      average_time_per_session: line
      totals.timeonsite_total: line
      totals.bounce_rate: line
      totals.timeonsite_average_per_session: line
    limit_displayed_rows: false
    hidden_series:
    - totals.bounce_rate
    y_axes:
    - label: ''
      orientation: bottom
      series:
      - id: totals.pageviews_total
        name: Page Views
        axisId: totals.pageviews_total
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 1577
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 1574
    - label:
      orientation: bottom
      series:
      - id: totals.bounce_rate
        name: Bounce Rate
        axisId: totals.bounce_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 1592
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 1589
    - label: ''
      orientation: bottom
      series:
      - id: totals.timeonsite_average_per_session
        name: Avg Session Duration
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 1607
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 1604
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
    query_timezone: America/New_York
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields:
    listen:
      Property: ga_sessions.property
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First TIme Visitor: ga_sessions.first_time_visitor
      Host: ga_sessions.has_host
      Search Keyword: trafficSource.keyword
      Goal Selection: ga_sessions.goal_selection
      Country: geoNetwork.country
    row: 13
    col: 6
    width: 6
    height: 10
  - title: Referrer
    name: Referrer
    model: event_analytics
    explore: ga_sessions
    type: looker_bar
    fields:
    - totals.timeonsite_average_per_session
    - totals.bounce_rate
    - totals.pageviews_total
    - trafficSource.referralPath
    filters:
      ga_sessions.date_period_comparison_period: 'Yes'
    sorts:
    - totals.pageviews_total desc
    limit: 10
    column_limit: 50
    stacking: ''
    colors:
    - "#B9E49A"
    - "#FDCB6C"
    - "#58A9F5"
    - "#FF666C"
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
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_colors:
      total_sessions: "#58A9F5"
      average_time_per_session: "#FDCB6C"
      average_pageviews_per_session: "#FF666C"
      totals.pageviews_total: "#5EC0C4"
      totals.timeonsite_average_per_session: "#BFBFBF"
    series_types:
      average_time_spent_per_page: line
      average_pageviews_per_session: line
      average_time_per_session: line
      totals.bounce_rate: line
      totals.timeonsite_total: line
      totals.timeonsite_average_per_session: line
    limit_displayed_rows: false
    hidden_series:
    - totals.bounce_rate
    y_axes:
    - label: ''
      orientation: bottom
      series:
      - id: totals.pageviews_total
        name: Page Views
        axisId: totals.pageviews_total
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 1714
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 1711
    - label:
      orientation: bottom
      series:
      - id: totals.bounce_rate
        name: Bounce Rate
        axisId: totals.bounce_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 1729
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 1726
    - label: ''
      orientation: bottom
      series:
      - id: totals.timeonsite_average_per_session
        name: Avg Session Duration
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 1744
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 1741
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
    query_timezone: America/New_York
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields: []
    listen:
      Property: ga_sessions.property
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First TIme Visitor: ga_sessions.first_time_visitor
      Host: ga_sessions.has_host
      Search Keyword: trafficSource.keyword
      Goal Selection: ga_sessions.goal_selection
      Country: geoNetwork.country
    row: 13
    col: 12
    width: 6
    height: 10
  - title: Search Keyword
    name: Search Keyword
    model: event_analytics
    explore: ga_sessions
    type: looker_bar
    fields:
    - trafficSource.keyword
    - totals.timeonsite_average_per_session
    - totals.bounce_rate
    - totals.pageviews_total
    filters:
      ga_sessions.date_period_comparison_period: 'Yes'
    sorts:
    - totals.pageviews_total desc
    limit: 10
    column_limit: 50
    dynamic_fields:
    - table_calculation: keyword
      label: Keyword
      expression: substring(${trafficSource.keyword},0,25)
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: string
    stacking: ''
    colors:
    - "#B9E49A"
    - "#FDCB6C"
    - "#58A9F5"
    - "#FF666C"
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
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_colors:
      total_sessions: "#58A9F5"
      average_time_per_session: "#FDCB6C"
      average_pageviews_per_session: "#FF666C"
      totals.pageviews_total: "#5EC0C4"
      totals.timeonsite_average_per_session: "#BFBFBF"
    series_types:
      average_time_spent_per_page: line
      average_pageviews_per_session: line
      average_time_per_session: line
      totals.bounce_rate: line
      totals.timeonsite_total: line
      totals.timeonsite_average_per_session: line
    limit_displayed_rows: false
    hidden_series:
    - totals.bounce_rate
    y_axes:
    - label: ''
      orientation: bottom
      series:
      - id: totals.pageviews_total
        name: Page Views
        axisId: totals.pageviews_total
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 1859
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 1856
    - label:
      orientation: bottom
      series:
      - id: totals.bounce_rate
        name: Bounce Rate
        axisId: totals.bounce_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 1874
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 1871
    - label: ''
      orientation: bottom
      series:
      - id: totals.timeonsite_average_per_session
        name: Avg Session Duration
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 1889
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 1886
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
    query_timezone: America/New_York
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields:
    - trafficSource.keyword
    listen:
      Property: ga_sessions.property
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First TIme Visitor: ga_sessions.first_time_visitor
      Host: ga_sessions.has_host
      Search Keyword: trafficSource.keyword
      Goal Selection: ga_sessions.goal_selection
      Country: geoNetwork.country
    row: 13
    col: 18
    width: 6
    height: 10
  - title: How often are your users coming back?
    name: How often are your users coming back?
    model: event_analytics
    explore: ga_sessions
    type: looker_column
    fields:
    - ga_sessions.unique_visitors
    - ga_sessions.visitnumber
    filters:
      ga_sessions.date_period_comparison_period: 'Yes'
    sorts:
    - ga_sessions.unique_visitors desc
    limit: 7
    column_limit: 5
    stacking: ''
    colors:
    - "#58A9F5"
    - "#FF666C"
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
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    point_style: none
    series_colors:
      ga_sessions.unique_visitors: "#5EC0C4"
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.unique_visitors
        name: Unique Visitors
        axisId: ga_sessions.unique_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 2092
      showLabels: true
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 2089
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Number of Visits
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_dropoff: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    note_state: collapsed
    note_display: above
    listen:
      Property: ga_sessions.property
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First TIme Visitor: ga_sessions.first_time_visitor
      Host: ga_sessions.has_host
      Search Keyword: trafficSource.keyword
      Goal Selection: ga_sessions.goal_selection
      Country: geoNetwork.country
    row: 34
    col: 12
    width: 12
    height: 8
  - title: How many seconds are users on your site?
    name: How many seconds are users on your site?
    model: event_analytics
    explore: ga_sessions
    type: looker_column
    fields:
    - ga_sessions.session_count
    - totals.timeonsite_tier
    filters:
      totals.timeonsite_tier: "-Undefined"
      ga_sessions.date_period_comparison_period: 'Yes'
    sorts:
    - totals.timeonsite_tier
    limit: 500
    column_limit: 50
    stacking: normal
    colors:
    - 'palette: Santa Cruz'
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      ga_sessions.session_count: "#5EC0C4"
    series_labels:
      ga_sessions.visitStart_hour_of_day: Hour of Day
      ga_sessions.visitStart_day_of_week: Day of Week
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: Session Count
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Sessions
        axisId: ga_sessions.session_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 1976
      showLabels: true
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 1973
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Time on Site
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
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_null_points: true
    interpolation: linear
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
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 2023
      bold: false
      italic: false
      strikethrough: false
      fields:
      - ga_sessions.session_count
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 2018
    note_state: collapsed
    note_display: above
    listen:
      Property: ga_sessions.property
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First TIme Visitor: ga_sessions.first_time_visitor
      Host: ga_sessions.has_host
      Search Keyword: trafficSource.keyword
      Goal Selection: ga_sessions.goal_selection
      Country: geoNetwork.country
    row: 34
    col: 0
    width: 12
    height: 8
  - title: Top Performing Pages
    name: Top Performing Pages
    model: event_analytics
    explore: ga_sessions
    type: table
    fields:
    - first_page.pageTitle
    - ga_sessions.session_count
    - totals.pageviews_total
    - ga_sessions.unique_visitors
    - ga_sessions.percent_new_users
    - totals.bounce_rate
    - totals.timeonsite_average_per_session
    - totals.timeonsite_total
    filters:
      ga_sessions.date_period_latest: 'Yes'
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
        - "#5EC0C4"
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 2173
      bold: false
      italic: false
      strikethrough: false
      fields:
      - totals.timeonsite_average_per_session
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 2168
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Custom
        colors:
        - "#FFFFFF"
        - "#5EC0C4"
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 2191
      bold: false
      italic: false
      strikethrough: false
      fields:
      - totals.timeonsite_total
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 2186
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Custom
        colors:
        - "#FFFFFF"
        - "#5EC0C4"
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
        __LINE_NUM: 2209
      bold: false
      italic: false
      strikethrough: false
      fields:
      - totals.bounce_rate
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4ac9dd140c2d0b4d46764a41e3df29fa8c1c781cb/behavior.dashboard.lookml
      __LINE_NUM: 2204
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting_ignored_fields: []
    query_timezone: America/New_York
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    font_size: '12'
    series_types: {}
    listen:
      Property: ga_sessions.property
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First TIme Visitor: ga_sessions.first_time_visitor
      Host: ga_sessions.has_host
      Search Keyword: trafficSource.keyword
      Goal Selection: ga_sessions.goal_selection
      Country: geoNetwork.country
    row: 44
    col: 0
    width: 24
    height: 8
  filters:
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
  - name: First TIme Visitor
    title: First TIme Visitor
    type: string_filter
    default_value: ''
    allow_multiple_values: true
    required: false
  - name: Host
    title: Host
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: event_analytics
    explore: ga_sessions
    listens_to_filters: []
    field: hits_page.hostName
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
  - name: Goal Selection
    title: Goal Selection
    type: field_filter
    default_value: No Selection
    allow_multiple_values: true
    required: false
    model: event_analytics
    explore: ga_sessions
    listens_to_filters: []
    field: ga_sessions.goal_selection
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

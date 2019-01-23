view: period_parameter {
  extension: required

  parameter: period {
    description: "Prior Period for Comparison"
    type: string
    allowed_value: {
      value: "day"
      label: "Day"
    }
    allowed_value: {
      value: "week"
      label: "Week (Mon - Sun)"
    }
    allowed_value: {
      value: "month"
      label: "Month"
    }
    allowed_value: {
      value: "quarter"
      label: "Quarter"
    }
    allowed_value: {
      value: "year"
      label: "Year"
    }
    allowed_value: {
      value: "7 day"
      label: "Last 7 Days"
    }
    allowed_value: {
      value: "28 day"
      label: "Last 28 Days"
    }
    allowed_value: {
      value: "91 day"
      label: "Last 91 Days"
    }
    allowed_value: {
      value: "364 day"
      label: "Last 364 Days"
    }
    default_value: "7 day"
  }
}

view: period_base {
  extends: [period_parameter]
  extension: required

  dimension: date_period {
    type: date
    convert_tz: no
    label_from_parameter: period
    group_label: "Event"
    sql: TIMESTAMP({% if period._parameter_value contains "day" %}
        {% if period._parameter_value == "'7 day'" %}${date_date_7_days_prior}
        {% elsif period._parameter_value == "'28 day'" %}${date_date_28_days_prior}
        {% elsif period._parameter_value == "'91 day'" %}${date_date_91_days_prior}
        {% elsif period._parameter_value == "'364 day'" %}${date_date_364_days_prior}
        {% else %}${date_date}
        {% endif %}
      {% elsif period._parameter_value contains "week" %}${date_week}
      {% elsif period._parameter_value contains "month" %}${date_month_date}
      {% elsif period._parameter_value contains "quarter" %}${date_quarter_date}
      {% elsif period._parameter_value contains "year" %}${date_year_date}
      {% endif %}) ;;
    allow_fill: no
  }
  dimension: date_end_of_period {
    type: date
    convert_tz: no
    label_from_parameter: period
    group_label: "Event"
    sql: TIMESTAMP({% if period._parameter_value contains "day" %}
        {% if period._parameter_value == "'7 day'" %}DATE_ADD(${date_period}, INTERVAL 7 DAY)
        {% elsif period._parameter_value == "'28 day'" %}DATE_ADD(${date_period}, INTERVAL 28 DAY)
        {% elsif period._parameter_value == "'91 day'" %}DATE_ADD(${date_period}, INTERVAL 91 DAY)
        {% elsif period._parameter_value == "'364 day'" %}DATE_ADD(${date_period}, INTERVAL 364 DAY)
        {% else %}${date_date}
        {% endif %}
      {% elsif period._parameter_value contains "week" %}DATE_ADD(${date_period}, INTERVAL 1 WEEK)
      {% elsif period._parameter_value contains "month" %}DATE_ADD(${date_period}, INTERVAL 1 MONTH)
      {% elsif period._parameter_value contains "quarter" %}DATE_ADD(${date_period}, INTERVAL 1 QUARTER)
      {% elsif period._parameter_value contains "year" %}DATE_ADD(${date_period}, INTERVAL 1 YEAR)
      {% endif %}) ;;
    allow_fill: no
  }
  dimension: date_period_latest {
    hidden: yes
    description: "Is the selected period (This Period) the current period?"
    type: yesno
    group_label: "Event"
    sql: ${_date} >= ${date_period_start_date_latest_period} AND ${_date} < ${date_period_end_date} ;;
  }
  dimension: date_period_dynamic_grain {
    hidden: yes
    type: date
    convert_tz: no
    group_label: "Event"
    label: "{% if period._parameter_value contains 'year'
    # or period._parameter_value contains '364 day' %}Month{% elsif period._parameter_value contains 'quarter'
    #or period._parameter_value contains '91 day' %}Week{% else %}Date{% endif %}"
    sql: {% if period._parameter_value contains 'year'
        or period._parameter_value contains '364 day' %}${date_month_date}
      {% elsif period._parameter_value contains 'quarter'
        or period._parameter_value contains '91 day' %}${date_week}
      {% else %} ${date_raw}
      {% endif %} ;;
    allow_fill: no
  }
  dimension: date_day_of_period {
    hidden: yes
    type: number
    label: "{% if period._parameter_value contains 'day' %}Day of Period
    {% elsif period._parameter_value contains 'week' %}Day of Week
    {% elsif period._parameter_value contains 'month' %}Day of Month
    {% elsif period._parameter_value contains 'quarter' %}Day of Quarter
    {% elsif period._parameter_value contains 'year' %}Day of Year
    {% endif %}"
    group_label: "Event"
    sql: {% if period._parameter_value contains "day" %}
        {% if period._parameter_value == "'7 day'" %}${date_day_of_7_days_prior}
        {% elsif period._parameter_value == "'28 day'" %}${date_day_of_28_days_prior}
        {% elsif period._parameter_value == "'91 day'" %}${date_day_of_91_days_prior}
        {% elsif period._parameter_value == "'364 day'" %}${date_day_of_364_days_prior}
        {% else %}0
        {% endif %}
      {% elsif period._parameter_value contains "week" %}${date_day_of_week_index}
      {% elsif period._parameter_value contains "month" %}${date_day_of_month}
      {% elsif period._parameter_value contains "quarter" %}${date_day_of_quarter}
      {% elsif period._parameter_value contains "year" %}${date_day_of_year}
      {% endif %} ;;
    # html: {{ value | plus: 1 }} - {{ date_date }};;
    # required_fields: [date_date]
  }
  dimension: date_last_period {
    group_label: "Event"
    label: "Prior Period"
    type: date
    convert_tz: no
    sql: DATE_ADD(${date_period},
    INTERVAL -{% if period._parameter_value == "'7 day'" %}7
    {% elsif period._parameter_value == "'28 day'" %}28
    {% elsif period._parameter_value == "'91 day'" %}91
    {% elsif period._parameter_value == "'364 day'" %}364
    {% else %}1
    {% endif %}
    {% if period._parameter_value contains "day" %}day
    {% elsif period._parameter_value contains "week" %}week
    {% elsif period._parameter_value contains "month" %}month
    {% elsif period._parameter_value contains "quarter" %}quarter
    {% elsif period._parameter_value contains "year" %}year
    {% endif %}) ;;
    allow_fill: no
  }
  dimension: date_period_start_date_comparison_period {
    hidden: no
    description: "Start date for last two periods"
    type: date
    group_label: "Event"
    sql: TIMESTAMP(DATETIME_ADD(CURRENT_DATETIME(), INTERVAL -2
      {% if period._parameter_value contains "day" %}
        {% if period._parameter_value == "'7 day'" %}*7 DAY
        {% elsif period._parameter_value == "'28 day'" %}*28 DAY
        {% elsif period._parameter_value == "'91 day'" %}*91 DAY
        {% elsif period._parameter_value == "'364 day'" %}*364 DAY
        {% else %} DAY
        {% endif %}
      {% elsif period._parameter_value contains "week" %} WEEK
      {% elsif period._parameter_value contains "month" %} MONTH
      {% elsif period._parameter_value contains "quarter" %} QUARTER
      {% elsif period._parameter_value contains "year" %} YEAR
      {% endif %})) ;;
  }

  dimension: date_period_start_date_latest_period {
    hidden: no
    description: "Start date for last two periods"
    type: date
    group_label: "Event"
    sql: TIMESTAMP(DATETIME_ADD(CURRENT_DATETIME(), INTERVAL -1
      {% if period._parameter_value contains "day" %}
        {% if period._parameter_value == "'7 day'" %}*7 DAY
        {% elsif period._parameter_value == "'28 day'" %}*28 DAY
        {% elsif period._parameter_value == "'91 day'" %}*91 DAY
        {% elsif period._parameter_value == "'364 day'" %}*364 DAY
        {% else %} DAY
        {% endif %}
      {% elsif period._parameter_value contains "week" %} WEEK
      {% elsif period._parameter_value contains "month" %} MONTH
      {% elsif period._parameter_value contains "quarter" %} QUARTER
      {% elsif period._parameter_value contains "year" %} YEAR
      {% endif %})) ;;
  }

  dimension: date_period_end_date {
    hidden: yes
    description: "Start date for last two periods?"
    type: date
    group_label: "Event"
    sql: CURRENT_TIMESTAMP() ;;
  }

  dimension: date_period_comparison_period {
    hidden: yes
    description: "Is the selected period (This Period) in the last two periods?"
    type: yesno
    group_label: "Event"
    sql: ${_date} >= ${date_period_start_date_comparison_period} AND ${_date} < ${date_period_end_date} ;;
  }
}

view: sessions_period_base {
  extends: [period_base]
  extension: required

  parameter: single_property {
    hidden: yes
    description: "Single Property?"
    type: string
    default_value: "Yes"
  }

  dimension: date_period_latest {
    description: "Is the selected period (This Period) the current period?"
    type: yesno
    group_label: "Event"
    sql:
      {% if single_property._parameter_value == "'Yes'" %}
      ${partition_date} >= DATE_ADD(${date_period_start_date_latest_period}, INTERVAL -1 DAY) AND ${partition_date} <= ${date_period_end_date} AND
      ${_date} >= ${date_period_start_date_latest_period} AND ${_date} < ${date_period_end_date}
      {% else %}
      ${_date} >= ${date_period_start_date_latest_period} AND ${_date} < ${date_period_end_date}
      {% endif %} ;;
  }

  dimension: date_period_comparison_period {
    hidden: yes
    description: "Is the selected period (This Period) in the last two periods?"
    type: yesno
    group_label: "Event"
    sql:
      {% if single_property._parameter_value == "'Yes'" %}
      ${partition_date} >= DATE_ADD(${date_period_start_date_comparison_period}, INTERVAL -1 DAY) AND ${partition_date} <= ${date_period_end_date} AND
      ${_date} >= ${date_period_start_date_comparison_period} AND ${_date} < ${date_period_end_date}
      {% else %}
      ${_date} >= ${date_period_start_date_comparison_period} AND ${_date} < ${date_period_end_date}
      {% endif %} ;;
  }
}

view: period_fact_period_base {
  extends: [period_base]
  extension: required

  dimension: date_period {
    sql: TIMESTAMP({% if period_fact.period._parameter_value contains "day" %}
        {% if period_fact.period._parameter_value == "'7 day'" %}${date_date_7_days_prior}
        {% elsif period_fact.period._parameter_value == "'28 day'" %}${date_date_28_days_prior}
        {% elsif period_fact.period._parameter_value == "'91 day'" %}${date_date_91_days_prior}
        {% elsif period_fact.period._parameter_value == "'364 day'" %}${date_date_364_days_prior}
        {% else %}${date_date}
        {% endif %}
      {% elsif period_fact.period._parameter_value contains "week" %}${date_week}
      {% elsif period_fact.period._parameter_value contains "month" %}${date_month_date}
      {% elsif period_fact.period._parameter_value contains "quarter" %}${date_quarter_date}
      {% elsif period_fact.period._parameter_value contains "year" %}${date_year_date}
      {% endif %}) ;;
  }
  dimension: date_end_of_period {
    sql: TIMESTAMP({% if period_fact.period._parameter_value contains "day" %}
        {% if period_fact.period._parameter_value == "'7 day'" %}DATE_ADD(${date_period}, INTERVAL 7 DAY)
        {% elsif period_fact.period._parameter_value == "'28 day'" %}DATE_ADD(${date_period}, INTERVAL 28 DAY)
        {% elsif period_fact.period._parameter_value == "'91 day'" %}DATE_ADD(${date_period}, INTERVAL 91 DAY)
        {% elsif period_fact.period._parameter_value == "'364 day'" %}DATE_ADD(${date_period}, INTERVAL 364 DAY)
        {% else %}${date_date}
        {% endif %}
      {% elsif period_fact.period._parameter_value contains "week" %}DATE_ADD(${date_period}, INTERVAL 1 WEEK)
      {% elsif period_fact.period._parameter_value contains "month" %}DATE_ADD(${date_period}, INTERVAL 1 MONTH)
      {% elsif period_fact.period._parameter_value contains "quarter" %}DATE_ADD(${date_period}, INTERVAL 1 QUARTER)
      {% elsif period_fact.period._parameter_value contains "year" %}DATE_ADD(${date_period}, INTERVAL 1 YEAR)
      {% endif %}) ;;
  }
  dimension: date_period_dynamic_grain {
    label: "{% if period_fact.period._parameter_value contains 'year'
    # or period_fact.period._parameter_value contains '364 day' %}Month{% elsif period_fact.period._parameter_value contains 'quarter'
    #or period_fact.period._parameter_value contains '91 day' %}Week{% else %}Date{% endif %}"
    sql: {% if period_fact.period._parameter_value contains 'year'
        or period_fact.period._parameter_value contains '364 day' %}${date_month_date}
      {% elsif period_fact.period._parameter_value contains 'quarter'
        or period_fact.period._parameter_value contains '91 day' %}${date_week}
      {% else %} ${date_raw}
      {% endif %} ;;
  }
  dimension: date_day_of_period {
    label: "{% if period_fact.period._parameter_value contains 'day' %}Day of Period
    {% elsif period_fact.period._parameter_value contains 'week' %}Day of Week
    {% elsif period_fact.period._parameter_value contains 'month' %}Day of Month
    {% elsif period_fact.period._parameter_value contains 'quarter' %}Day of Quarter
    {% elsif period_fact.period._parameter_value contains 'year' %}Day of Year
    {% endif %}"
    sql: {% if period_fact.period._parameter_value contains "day" %}
        {% if period_fact.period._parameter_value == "'7 day'" %}${date_day_of_7_days_prior}
        {% elsif period_fact.period._parameter_value == "'28 day'" %}${date_day_of_28_days_prior}
        {% elsif period_fact.period._parameter_value == "'91 day'" %}${date_day_of_91_days_prior}
        {% elsif period_fact.period._parameter_value == "'364 day'" %}${date_day_of_364_days_prior}
        {% else %}0
        {% endif %}
      {% elsif period_fact.period._parameter_value contains "week" %}${date_day_of_week_index}
      {% elsif period_fact.period._parameter_value contains "month" %}${date_day_of_month}
      {% elsif period_fact.period._parameter_value contains "quarter" %}${date_day_of_quarter}
      {% elsif period_fact.period._parameter_value contains "year" %}${date_day_of_year}
      {% endif %} ;;
  }
  dimension: date_period_start_date_comparison_period {
    sql: DATETIME_ADD(CURRENT_DATETIME(), INTERVAL -2
      {% if period._parameter_value contains "day" %}
        {% if period._parameter_value == "'7 day'" %}*7 DAY
        {% elsif period._parameter_value == "'28 day'" %}*28 DAY
        {% elsif period._parameter_value == "'91 day'" %}*91 DAY
        {% elsif period._parameter_value == "'364 day'" %}*364 DAY
        {% else %} DAY
        {% endif %}
      {% elsif period._parameter_value contains "week" %} WEEK
      {% elsif period._parameter_value contains "month" %} MONTH
      {% elsif period._parameter_value contains "quarter" %} QUARTER
      {% elsif period._parameter_value contains "year" %} YEAR
      {% endif %}) ;;
  }
}

view: event_filters {
  extension: required
  filter: event_1_filter {
    label: "Event 1"
    type: string
    suggest_dimension: hits_eventInfo.eventCategory
    suggest_explore: ga_sessions
    hidden: yes
  }

  filter: event_2_filter {
    label: "Event 2"
    type: string
    suggest_dimension: hits_eventInfo.eventCategory
    suggest_explore: ga_sessions
    hidden: yes
  }

  filter: event_3_filter {
    label: "Event 3"
    type: string
    suggest_dimension: hits_eventInfo.eventCategory
    suggest_explore: ga_sessions
    hidden: yes
  }

  filter: event_4_filter {
    label: "Event 4"
    type: string
    suggest_dimension: hits_eventInfo.eventCategory
    suggest_explore: ga_sessions
    hidden: yes
  }
}

view: event_base {
  extends: [event_filters]
  extension: required

  dimension: event_1_ts {
    hidden: yes
    type: number
    sql: CASE WHEN
      {% condition ga_sessions.event_1_filter %} ${hits_eventInfo.eventCategory} {% endcondition %}
      THEN ${hits.hitSeconds}
      ELSE NULL END
    ;;
  }

  dimension: event_2_ts {
    hidden: yes
    type: number
    sql: CASE WHEN
      {% condition ga_sessions.event_2_filter %} ${hits_eventInfo.eventCategory} {% endcondition %}
      THEN ${hits.hitSeconds}
      ELSE NULL END
    ;;
  }

  dimension: event_3_ts {
    hidden: yes
    type: number
    sql: CASE WHEN
      {% condition ga_sessions.event_3_filter %} ${hits_eventInfo.eventCategory} {% endcondition %}
      THEN ${hits.hitSeconds}
      ELSE NULL END
    ;;
  }

  dimension: event_4_ts {
    hidden: yes
    type: number
    sql: CASE WHEN
      {% condition ga_sessions.event_4_filter %} ${hits_eventInfo.eventCategory} {% endcondition %}
      THEN ${hits.hitSeconds}
      ELSE NULL END
    ;;
  }

  measure: min_event_1_ts {
    hidden: yes
    type: min
    sql: ${event_1_ts} ;;
  }

  measure: min_event_2_ts {
    hidden: yes
    type: min
    sql: ${event_2_ts} ;;
  }

  measure: min_event_3_ts {
    hidden: yes
    type: min
    sql: ${event_3_ts} ;;
  }

  measure: min_event_4_ts {
    hidden: yes
    type: min
    sql: ${event_4_ts} ;;
  }

  measure: max_event_2_ts {
    hidden: yes
    type: max
    sql: ${event_2_ts} ;;
  }

  measure: max_event_3_ts {
    hidden: yes
    type: max
    sql: ${event_3_ts} ;;
  }

  measure: max_event_4_ts {
    hidden: yes
    type: max
    sql: ${event_4_ts} ;;
  }
}

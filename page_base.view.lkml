view: page_filters {
  extension: required
  filter: page_1 {
    label: "Page 1"
    type: string
    suggest_dimension: hits_page.pageTitle
    suggest_explore: ga_sessions
    hidden: yes
  }

  filter: page_2 {
    label: "Page 2"
    type: string
    suggest_dimension: hits_page.pageTitle
    suggest_explore: ga_sessions
    hidden: yes
  }

  filter: page_3 {
    label: "Page 3"
    type: string
    suggest_dimension: hits_page.pageTitle
    suggest_explore: ga_sessions
    hidden: yes
  }

  filter: page_4 {
    label: "Page 4"
    type: string
    suggest_dimension: hits_page.pageTitle
    suggest_explore: ga_sessions
    hidden: yes
  }
}

view: page_base {
  extends: [page_filters]
  extension: required

  dimension: page_1_ts {
    hidden: yes
    type: number
    sql: CASE WHEN
      {% condition ga_sessions.page_1 %} ${hits_page.pageTitle} {% endcondition %}
      THEN ${hits.hitSeconds}
      ELSE NULL END
    ;;
  }

  dimension: page_2_ts {
    hidden: yes
    type: number
    sql: CASE WHEN
      {% condition ga_sessions.page_2 %} ${hits_page.pageTitle} {% endcondition %}
      THEN ${hits.hitSeconds}
      ELSE NULL END
    ;;
  }

  dimension: page_3_ts {
    hidden: yes
    type: number
    sql: CASE WHEN
      {% condition ga_sessions.page_3 %} ${hits_page.pageTitle} {% endcondition %}
      THEN ${hits.hitSeconds}
      ELSE NULL END
    ;;
  }

  dimension: page_4_ts {
    hidden: yes
    type: number
    sql: CASE WHEN
      {% condition ga_sessions.page_4 %} ${hits_page.pageTitle} {% endcondition %}
      THEN ${hits.hitSeconds}
      ELSE NULL END
    ;;
  }

  measure: min_page_1_ts {
    hidden: yes
    type: min
    sql: ${page_1_ts} ;;
  }

  measure: min_page_2_ts {
    hidden: yes
    type: min
    sql: ${page_2_ts} ;;
  }

  measure: min_page_3_ts {
    hidden: yes
    type: min
    sql: ${page_3_ts} ;;
  }

  measure: min_page_4_ts {
    hidden: yes
    type: min
    sql: ${page_4_ts} ;;
  }

  measure: max_page_2_ts {
    hidden: yes
    type: max
    sql: ${page_2_ts} ;;
  }

  measure: max_page_3_ts {
    hidden: yes
    type: max
    sql: ${page_3_ts} ;;
  }

  measure: max_page_4_ts {
    hidden: yes
    type: max
    sql: ${page_4_ts} ;;
  }
}

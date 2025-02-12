{% macro margin_percent(purchase_costs,revenue) %}
    ROUND(SAFE_DIVIDE((revenue-purchase_costs), revenue),2)
 {% endmacro %}


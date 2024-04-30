
{% macro calculate_discounted_price(extended_price, discount) %}
    {{ extended_price }} * (1 - {{ discount }})
{% endmacro %}
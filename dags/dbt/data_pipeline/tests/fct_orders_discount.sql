SELECT
    *
FROM
    {{ ref('fct_orders') }}
WHERE
    discounted_price < 0
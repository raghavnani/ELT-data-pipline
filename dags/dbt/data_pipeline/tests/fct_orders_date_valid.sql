SELECT
    *
FROM
    {{ ref('fct_orders') }}
WHERE
    date(order_date) < date('1950-03-15')
    or date(order_date) > CURRENT_DATE()
SELECT
    orders.*,
    order_items_summary.total_price,
    order_items_summary.total_price - order_items_summary.total_discounted_price as discounted_price
FROM
    {{ ref('stg_tpch_orders') }} as orders
JOIN
    {{ ref('int_order_items_summary') }} as order_items_summary
ON
    orders.order_key = order_items_summary.order_key
ORDER BY
    orders.order_key
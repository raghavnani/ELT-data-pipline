SELECT
    line_items.order_item_key,
    orders.order_key,
    line_items.line_number,
    line_items.part_key,
    line_items.quantity,
    line_items.extended_price,
    line_items.discount,
    {{
        calculate_discounted_price('line_items.extended_price', 'line_items.discount')
    }} as discounted_price
FROM
    {{ ref('stg_tpch_orders') }} as orders
JOIN
    {{ ref('stg_tpch_line_items') }} as line_items
ON
    orders.order_key = line_items.order_key
ORDER BY
    orders.order_key

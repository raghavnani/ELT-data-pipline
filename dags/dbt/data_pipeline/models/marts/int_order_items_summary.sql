SELECT 
    order_key,
    sum(extended_price) as total_price,
    sum(discounted_price) as total_discounted_price
FROM
    {{ ref('int_order_items') }}
GROUP BY
    order_key
SELECT 
m.date_date,
m.orders_id,
m.margin,
m.revenue,
s.shipping_fee,
s.logcost,
s.ship_cost,
ROUND(((margin + shipping_fee) - (logcost + ship_cost)),1) AS operational_margin
FROM {{ ref("stg_raw__ship")}} as s 
JOIN {{ ref("int_sales_margin")}} as m
USING (orders_id)

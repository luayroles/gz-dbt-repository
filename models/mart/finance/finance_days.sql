
SELECT
m.date_date,
ROUND(SUM(m.revenue),1) AS revenue,
ROUND(COUNT(o.orders_id),1) AS orderes_id,
ROUND(SAFE_DIVIDE(SUM(m.revenue),COUNT(m.orders_id)),1) AS average_basket,
ROUND(SUM(o.operational_margin),1) AS ope_margin,
ROUND(SUM (m.purchase_costs),1) AS purchase_costs,
ROUND(SUM(o.shipping_fee),1) AS shipping_fee,
ROUND(SUM(o.logcost),1) AS logcost,
ROUND(SUM(o.ship_cost),1) AS ship_cost,
ROUND(SUM(m.quantity),1) AS total_revenue,
from {{ ref("int_sales_margin")}}  as m
JOIN {{ ref("int_orders_operational")}} as o
USING (orders_id)
GROUP BY date_date

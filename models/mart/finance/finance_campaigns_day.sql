SELECT
EXTRACT (MONTH FROM cd.date_date) as MONTH,
ROUND(SUM(f.ope_margin - cd.ads_cost),1) AS ads_margin,
ROUND(SUM(f.revenue),1) AS revenue,
ROUND(SUM(f.orderes_id),1)AS orderes_id,
ROUND(SUM(f.average_basket),1)AS average_basket,
ROUND(SUM(f.ope_margin),1)AS ope_margin,
ROUND(SUM(f.purchase_costs),1)AS purchase_costs,
ROUND(SUM(f.shipping_fee),1)AS shipping_fee,
ROUND(SUM(f.logcost),1) AS logcost,
ROUND(SUM(f.ship_cost),1) AS ship_cost,
ROUND(SUM(f.total_revenue),1)AS tot_revenue
FROM {{ ref("int_campaigns_day")}} as cd
JOIN {{ ref("finance_days")}} as f
USING (date_date)
GROUP BY EXTRACT (MONTH FROM cd.date_date)
ORDER BY EXTRACT (MONTH FROM cd.date_date) DESC 
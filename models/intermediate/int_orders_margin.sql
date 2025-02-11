SELECT 
date_date,
orders_id,
round(SUM(revenue),1) AS revenue,
round(SUM (quantity),1) AS quantity,
FROM {{ ref("int_sales_margin")}}
GROUP BY date_date,orders_id
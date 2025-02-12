WITH XO AS ( 
SELECT
s.date_date,
s.orders_id,
s.products_id,
s.revenue,
s.quantity,
p.purchase_price,
round((s.quantity * p.purchase_price),1) AS purchase_costs
from {{ ref("stg_raw__product")}}  as p
JOIN {{ ref("stg_raw__sales")}} as s
USING (products_id)
)

SELECT 
date_date,
orders_id,
products_id,
revenue,
quantity,
purchase_price,
purchase_costs,
round((revenue - purchase_costs),1) AS margin, 
{{ margin_percent('p.purchase_costs','s.revenue') }} AS margin_percent
FROM XO
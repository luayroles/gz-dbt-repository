WITH XO AS ( 
SELECT
s.date_date,
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
products_id,
revenue,
quantity,
purchase_price,
purchase_costs,
round((revenue - purchase_costs),1) AS margin, 
FROM XO
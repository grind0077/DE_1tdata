with fact_sales as (SELECT 1 AS shop_id, 'dns' as shop_name, * FROM shop_dns
UNION SELECT 2 AS shop_id, 'mvideo' as shop_name, * FROM shop_mvideo
UNION SELECT 3 AS shop_id, 'sitilink' as shop_name, * FROM shop_sitilink)

select shop_name,
       product_name, 
       sales_cnt AS sales_fact, 
       plan_cnt AS sales_plan, 
       (sales_cnt/plan_cnt) AS sales_ratio, 
       (sales_cnt * price) AS income_fact, 
       (plan_cnt * price) AS income_plan, 
       (income_fact/income_plan) AS income_ratio
from PLAN  p
 left join fact_sales f
    on p.product_id = f.product_id
 join products prod
    on p.product_id = prod.product_id
GROUP BY shop_name;

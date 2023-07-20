# like

select
	*
from
	product_tb
where
	product_name like 'NO%'
    or product_name like 'PROPERTY%'
-- 	product_name like in('NO%', 'PROPERTY%')
    ;
    
    
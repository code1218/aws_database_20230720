# 조건문
select
	*,
    case
		when product_price < 100000 then '10만원 미만'
		when product_price < 200000 then '20만원 미만'
        else '20만원 이상'
    end as '가격 범위',
	if(product_price < 100000, '10만원 미만', '10만원 이상') as '가격 범위2',
    if(size_m is null, '사이즈 없음', size_m) as size_m2,
    ifnull(size_m, '사이즈 없음') as size_m3,
    nullif(size_m, 'M') as size_m4
from
	product_tb;
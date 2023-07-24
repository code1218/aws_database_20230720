# 1. 각 계정별로 어떤 기부를 했는지 조회하시오.
select
	gvt.giver_id,
    gvt.user_id,
    ut.name,
    gvt.giving_page_id,
    gpt.story_title,
    gvt.giving_total
from
	giver_tb gvt
    left outer join user_tb ut on(ut.user_id = gvt.user_id)
    left outer join giving_page_tb gpt on(gpt.giving_page_id = gvt.giving_page_id)
order by
	gvt.user_id;
    
# 2. 센터별로 총 기부액이 얼마인지 조회하시오.
select
	ct.center_id,
    ct.center_name,
    ct.center_address,
    sum(gvt.giving_total) as total_giving_money
from
	center_tb ct
	left outer join giving_page_tb gpt on(gpt.center_id = ct.center_id)
    left outer join giver_tb gvt on(gvt.giving_page_id = gpt.giving_page_id)
group by
	ct.center_id,
    ct.center_name,
    ct.center_address;

# 3. 기부 항목별 총 기부액 조회
select
	gpt.giving_page_id,
    gpt.giving_name,
    ifnull(sum(gvt.giving_total), 0) as total_giving_money
from
	giving_page_tb gpt
    left outer join giver_tb gvt on(gvt.giving_page_id = gpt.giving_page_id)
group by
	gpt.giving_page_id,
    gpt.giving_name;
    
# 4. 카테고리 별로 총 기부액 조회
select
	gct.giving_category_name,
    ifnull(sum(gvt.giving_total), 0) as total_giving_money
from
	giving_category_tb gct
    left outer join giving_page_tb gpt on(gpt.category_id = gct.giving_category_id)
    left outer join giver_tb gvt on(gvt.giving_page_id = gpt.giving_page_id)
group by
	gct.giving_category_name









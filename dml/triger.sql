insert into user_tb
values(0, '김준일');

insert into table1
select
	0,
    (select ifnull(max(user_id), 0) from user_tb),
    concat((select 
				name
			from 
				user_tb 
			where 
				user_id = (select 
								ifnull(max(user_id), 0)
							from 
								user_tb)), '의 자기소개');

insert into table1
values(0, 1, '김준일의 자기소개');

insert into table2
values(0, 1, '자기소개 내용을 입력하세요.');

delete
from
	user_tb
where
	name = '김준일';








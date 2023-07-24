# 사용자 추가
create user test1@192.168.0.1 identified by '1234';

use mysql;
select host, user from user;

# 사용자 권한
revoke all on study3.* from test1@localhost;

grant all privileges on study3.user_tb to test1@localhost;

create user 'test2'@'%' identified by '1234';

use mysql;
select host, user from user;

alter user 'test2'@'%' identified by '1111';
flush privileges;

alter user 'test1'@'localhost' identified by '1111';
flush privileges;

grant select, insert on `study3`.`user_tb` to 'test2'@'%';
flush privileges;

revoke insert on `study3`.`user_tb` from 'test2'@'%';
flush privileges;

show grants for 'test2'@'%';


# '자신의 이름(영문)'@서버에서만 접속 가능, 비밀번호는 1234
create user 'junil'@'localhost' identified by '1234';

# 해당 계정의 비밀번호를 1q2w3e4r로 변경
alter user 'junil'@'localhost' identified by '1q2w3e4r';

# 권한 study2 데이터베이스 -> user_tb(select, insert, update, delete)
grant select, insert, update, delete on `study2`.`user_tb` to 'junil'@'localhost';
flush privileges;

show grants for 'junil'@'localhost';

# update 권한 회수
revoke update on `study2`.`user_tb` from 'junil'@'localhost';
flush privileges;

# 권한 study3 데이터베이스 -> product_tb(select)
grant select on `study3`.`product_tb` to 'junil'@'localhost';
flush privileges;

show grants for 'junil'@'localhost';
flush privileges;

# delete 권한 추가
grant delete on `study3`.`product_tb` to 'junil'@'localhost';
flush privileges;

show grants for 'junil'@'localhost';

select version();



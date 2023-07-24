select @@autocommit;
set autocommit = 0;	#commit off

start transaction;

savepoint insert_user;

insert into user_tb
values(0, 'ddd', '1234');

savepoint update_user_password;

update user_tb set password = '1111' where username = 'ddd';

rollback to savepoint update_user_password;

rollback to savepoint insert_user;

rollback;

commit;

    

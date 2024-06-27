create table users(
    id BIGSERIAL primary key ,
    name varchar(256)
);
insert into  users (name)
VALUES ('Shamil');
insert into  users (name)
VALUES ('Ali');

select * from users;

select name, now() from users;
delete from users where id =1;
ALTER  table users add column salary numeric(16,2);
ALTER table users rename column name to user_name;
update users set salary =4000 where 1=1;
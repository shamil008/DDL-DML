create table customers(
    customer_id BIGSERIAL PRIMARY KEY,
    custamer_name varchar(256),
    customer_surname varchar(256)
)
create table cards(
    card_id BIGSERIAL PRIMARY KEY ,
    customer_id INTEGER references customers(customer_id),
    expire_date Date
)

select * from customers;

select * from cards;

-- OneToMany
select c.custamer_name,c.customer_surname,cd.expire_date from customers c,cards cd
where c.customer_id = cd.customer_id;

create table students(
        student_id BigSerial Primary Key,
        student_name Varchar(256),
        student_surname Varchar(256)
)
create table education_cards(
    card_id BIGSERIAL PRIMARY KEY ,
    student_id INTEGER references students(student_id),
    university varchar(256)
)
-- OneToOne
select s.student_name,s.student_surname, ec.university from students s inner join education_cards ec
on s.student_id = ec.student_id;

create table product(
    product_id BIGSERIAL PRIMARY KEY ,
    product_name varchar(256),
    product_price numeric(16,2)
)

create table Orders(
    order_id BIGSERIAL primary key ,
    customer_id INTEGER references customers(customer_id),
    product_id Integer references product(product_id)
)
--ManyToMany
select c.custamer_name,c.customer_surname,p.product_name,p.product_price from customers c inner join orders o
on c.customer_id = o.customer_id inner join product p on o.product_id = p.product_id where p.product_price>500;



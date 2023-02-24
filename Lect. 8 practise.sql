-- 1.
create database mydb;
-- 2.
use mydb;
-- 3.
create table product (prodid integer, productname varchar(50), quantity integer, amount decimal(10,2));
-- 4. 
insert into product values
(1000, 'Grocerries', 10, 5200.30),
(1001, 'Chocolates', 20, 2000.0),
(1002, 'TV', 2, 80000),
(1003, 'Mobile', 1, 45000),
(1004, 'Cricket ball', 5, 2500),
(1005, 'Stationary', 3, 6000.60),
(1006, 'Breads', 10, 500),
(1007, 'Washing machine', 1, 52000.30),
(1008, 'Table', 2, 2000),
(1009, 'Chairs', 12, 6000);
-- 5.
create table customer (custid integer, custname varchar(50), age integer, gender char(1), city varchar(50));
-- 6.
insert into customer values (1, 'Shanti', 25, 'F', 'Nagpur'),
(2, 'Mayuri', 55, 'F', 'Kanpur'),
(3, 'Subhash', 35, 'M', 'Pune'),
(4, 'Priyank', 47, 'M', 'Mohali'),
(5, 'Sakshi', 53, 'F', 'Bangalore');
-- 7.
create table txn (txnid integer, custid integer, prodid integer);

-- 8.
select custid, custname, age, gender, city from customer c cross join product p;
select t.custid, c.custname, c.age, c.gender, c.city, p.productname, p.amount from txn t inner join  customer c on t.custid=c.custid
inner join product p on t.prodid=p.prodid;


-- CASE STATEMENT

use training;
SELECT * FROM CUSTOMER;

SELECT custid, custname, city ,CASE 
WHEN city='Bangalore' THEN 'kannadam'
WHEN city='Hyderabad' THEN 'Telugu'
WHEN city='Chennai' THEN 'Tamil'
WHEN city IN ('Mumbai', 'Pune') THEN 'Marathi'
ELSE 'Hindi'
END AS language
FROM CUSTOMER;

select * from customer1;
set sql_safe_updates=0;
UPDATE CUSTOMER1 SET gender=CASE 
WHEN gender='M' THEN 'F'
ELSE 'M' END;

-- Ranks

CREATE TABLE TRANSACTION_TABLE(
transid INT,
prodname VARCHAR(100),
amount INT,
country varchar(100)
);
INSERT INTO TRANSACTION_TABLE VALUES(1,'laptop',1000,'India'),
(2,'mobile',500,'USA'),
(3,'Dekstop',600,'Canada'),
(4,'Dekstop',500,'USA'),
(5,'TV',2000,'India'),
(6,'Tablet',500,'USA'),
(7,'TV',1000,'Canada'),
(8,'mobile',1500,'Canada'),
(9,'TV',1000,'USA');

SELECT * FROM TRANSACTION_TABLE;

SELECT transid,prodname,amount, country, row_number() OVER (ORDER BY amount DESC) as rnk FROM TRANSACTION_TABLE;
SELECT transid,prodname,amount, country, row_number() OVER (partition by country ORDER BY amount DESC) as rnk FROM TRANSACTION_TABLE;

-- RANK
SELECT transid,prodname,amount, country, rank() OVER (ORDER BY amount DESC) as rnk FROM TRANSACTION_TABLE;
SELECT transid,prodname,amount, country, rank() OVER (partition by country ORDER BY amount DESC) as rnk FROM TRANSACTION_TABLE;

-- DENSE_RANK
SELECT transid,prodname,amount, country, dense_rank() OVER (ORDER BY amount DESC) as rnk FROM TRANSACTION_TABLE;

SELECT transid,prodname,amount, country , rnk FROM 
(SELECT transid,prodname,amount, country, dense_rank() OVER (partition by country ORDER BY amount DESC) as rnk FROM TRANSACTION_TABLE) chn
WHERE rnk<=2;


























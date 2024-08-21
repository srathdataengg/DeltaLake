-- Databricks notebook source
-- MAGIC %python
-- MAGIC
-- MAGIC %run ../copy-datasets.py

-- COMMAND ----------

create table orders as
select * from parquet.`/mnt/demo-datasets/bookstore/orders`;

-- COMMAND ----------

select * from orders;

-- COMMAND ----------

create or replace table orders as
select * from parquet.`/mnt/demo-datasets/bookstore/orders`;

-- COMMAND ----------

describe history orders;

-- COMMAND ----------

insert overwrite table orders
select * from parquet.`/mnt/demo-datasets/bookstore/orders`;

-- COMMAND ----------

insert overwrite table orders
select *,current_timestamp() from parquet.`/mnt/demo-datasets/bookstore/orders`;

-- COMMAND ----------

insert into orders
select * from parquet.`/mnt/demo-datasets/bookstore/orders-new`

-- COMMAND ----------

select count(*) from orders;

-- COMMAND ----------

create or replace temp view customer_updates as
select * from json.`/mnt/demo-datasets/bookstore/customers-json-new`;

-- COMMAND ----------

select * from customer_updates;
-- select count(*) from customer_updates;

-- COMMAND ----------

select * from customers;

-- COMMAND ----------

-- DBTITLE 1,Merge in Delta lake
merge into customers c
using customer_updates u
on c.customer_id = u.customer_id
when matched and c.email is null and u.email is not null then
update set email = u.email, updated = u.updated
when not matched then insert *;

-- COMMAND ----------

CREATE OR REPLACE TEMP VIEW books_updates
   (book_id STRING, title STRING, author STRING, category STRING, price DOUBLE)
USING CSV
OPTIONS (
  path = "/mnt/demo-datasets/bookstore/books-csv-new",
  header = "true",
  delimiter = ";"
);

-- COMMAND ----------

select * from books_updates;

-- COMMAND ----------

CREATE TEMP VIEW books_tmp_vw
   (book_id STRING, title STRING, author STRING, category STRING, price DOUBLE)
USING CSV
OPTIONS (
  path = "/mnt/demo-datasets/bookstore/books-csv/export_*.csv",
  header = "true",
  delimiter = ";"
);



-- COMMAND ----------

CREATE TABLE books AS
  SELECT * FROM books_tmp_vw;
  


-- COMMAND ----------

SELECT * FROM books

-- COMMAND ----------

merge into books b
using books_updates u 
on b.book_id = u.book_id and b.title = u.title
when not matched and u.category = 'Computer Science' then
insert * ;

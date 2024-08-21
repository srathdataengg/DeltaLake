-- Databricks notebook source
-- MAGIC %python
-- MAGIC files = dbutils.fs.ls(f"/mnt/demo-datasets/bookstore/customers-json")
-- MAGIC display(files)

-- COMMAND ----------

SELECT * FROM json.`/mnt/demo-datasets/bookstore/customers-json/export_001.json`

-- COMMAND ----------

select * from json.`/mnt/demo-datasets/bookstore/customers-json/export_*.json`

-- COMMAND ----------

select *, input_file_name() source_file from
json.`/mnt/demo-datasets/bookstore/customers-json`;

-- COMMAND ----------

select * from text.`/mnt/demo-datasets/bookstore/customers-json`

-- COMMAND ----------

select * from binaryFile.`/mnt/demo-datasets/bookstore/customers-json`

-- COMMAND ----------

select * from csv.`/mnt/demo-datasets/bookstore/books-csv`

-- COMMAND ----------

drop table books_csv;

-- COMMAND ----------

create table books_csv
 (book_id STRING, title STRING, author STRING, category STRING, price DOUBLE)
 using CSV
 OPTIONS (
  header = "true",
  delimiter = ";"
 )
 location "/mnt/demo-datasets/bookstore/books-csv"


-- COMMAND ----------

select * from books_csv;

-- COMMAND ----------

DESCRIBE EXTENDED BOOKS_CSV

-- COMMAND ----------

CREATE TABLE customers AS
SELECT * FROM json.`/mnt/demo-datasets/bookstore/customers-json`;

DESCRIBE EXTENDED customers;

-- COMMAND ----------

CREATE TABLE books_unparsed AS
SELECT * FROM csv.`/mnt/demo-datasets/bookstore/books-csv`;

SELECT * FROM books_unparsed;

-- COMMAND ----------

DESCRIBE EXTENDED books_unparsed;

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

create table books_delta 
as 
select * from books_tmp_vw;

-- COMMAND ----------

select * from books_delta;

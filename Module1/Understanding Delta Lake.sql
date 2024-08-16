-- Databricks notebook source
CREATE TABLE employees(id INT, name STRING, salary DOUBLE);

-- COMMAND ----------

drop table default.employees;

-- COMMAND ----------

select * from default.employees;

-- COMMAND ----------

insert into employees values 
(1,'Adam',2500.0),
(2,'Sarah',3000.5),
(3, "John", 2999.3),
(4, "Thomas", 4000.3),
(5, "Anna", 2500.0),
(6, "Kim", 6200.3);


-- COMMAND ----------

update employees set salary = salary +100 where name like 'A%';

-- COMMAND ----------

describe detail employees;

-- COMMAND ----------

describe history employees;

-- COMMAND ----------

-- MAGIC %fs ls 'dbfs:/user/hive/warehouse/employees/_delta_log'

-- COMMAND ----------

-- MAGIC %fs head 'dbfs:/user/hive/warehouse/employees/_delta_log/00000000000000000003.json'

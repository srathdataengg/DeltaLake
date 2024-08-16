-- Databricks notebook source
create table managed_default(
  width int, length int, heght int
);

-- COMMAND ----------

insert into managed_default values (3,2,1)

-- COMMAND ----------

describe extended managed_default;

-- COMMAND ----------

CREATE TABLE external_default
  (width INT, length INT, height INT)
LOCATION 'dbfs:/mnt/demo/external_default';

-- COMMAND ----------

describe extended external_default;

-- COMMAND ----------

INSERT INTO external_default
VALUES (3 INT, 2 INT, 1 INT)

-- COMMAND ----------

select * from samples.nyctaxi.trips;

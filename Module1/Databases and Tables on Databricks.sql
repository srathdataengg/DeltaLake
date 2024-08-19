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

drop table managed_default;

-- COMMAND ----------

create schema new_default;

-- COMMAND ----------

use schema new_default;

-- COMMAND ----------

CREATE TABLE managed_new_default
  (width INT, length INT, height INT);

-- COMMAND ----------

INSERT INTO managed_new_default
VALUES (3 INT, 2 INT, 1 INT);

-- COMMAND ----------

describe extended managed_new_default;

-- COMMAND ----------

drop table managed_new_default;

-- COMMAND ----------

CREATE SCHEMA custom
LOCATION 'dbfs:/Shared/schemas/custom.db'



-- COMMAND ----------

DESCRIBE DATABASE EXTENDED custom

-- COMMAND ----------


USE custom;

CREATE TABLE managed_custom
(width INT, length INT, height INT);

-- COMMAND ----------

INSERT INTO managed_custom
VALUES (3 INT, 2 INT, 1 INT);

-- COMMAND ----------


CREATE TABLE external_custom
  (width INT, length INT, height INT)
LOCATION 'dbfs:/mnt/demo/external_custom';

-- COMMAND ----------

INSERT INTO external_custom
VALUES (3 INT, 2 INT, 1 INT);

-- COMMAND ----------

describe extended external_custom;

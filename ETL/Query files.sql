-- Databricks notebook source
-- MAGIC %python
-- MAGIC files = dbutils.fs.ls(f"/mnt/demo-datasets/bookstore/customers-json")
-- MAGIC display(files)

-- COMMAND ----------

SELECT * FROM json.`/mnt/demo-datasets/bookstore/customers-json/export_001.json`

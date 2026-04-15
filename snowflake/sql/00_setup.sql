create database if not exists CLAIMS_ANALYTICS;

create schema if not exists CLAIMS_ANALYTICS.RAW;
create schema if not exists CLAIMS_ANALYTICS.STG;
create schema if not exists CLAIMS_ANALYTICS.INT;
create schema if not exists CLAIMS_ANALYTICS.MART;
create schema if not exists CLAIMS_ANALYTICS.SNAPSHOT;

create or replace file format CLAIMS_ANALYTICS.RAW.CSV_FF
  type = csv
  skip_header = 1
  field_optionally_enclosed_by = '"'
  null_if = ('', 'NULL', 'null');

create or replace stage CLAIMS_ANALYTICS.RAW.CLAIMS_STAGE file_format = CLAIMS_ANALYTICS.RAW.CSV_FF;
create or replace stage CLAIMS_ANALYTICS.RAW.REMITTANCES_STAGE file_format = CLAIMS_ANALYTICS.RAW.CSV_FF;
create or replace stage CLAIMS_ANALYTICS.RAW.ACCOUNTS_STAGE file_format = CLAIMS_ANALYTICS.RAW.CSV_FF;
create or replace stage CLAIMS_ANALYTICS.RAW.COLLECTORS_STAGE file_format = CLAIMS_ANALYTICS.RAW.CSV_FF;
create or replace stage CLAIMS_ANALYTICS.RAW.PAYERS_STAGE file_format = CLAIMS_ANALYTICS.RAW.CSV_FF;
create or replace stage CLAIMS_ANALYTICS.RAW.FACILITIES_STAGE file_format = CLAIMS_ANALYTICS.RAW.CSV_FF;
create or replace stage CLAIMS_ANALYTICS.RAW.WORKQUEUE_ACTIONS_STAGE file_format = CLAIMS_ANALYTICS.RAW.CSV_FF;

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

create or replace stage CLAIMS_ANALYTICS.RAW.CLAIMS_STAGE_B1
  file_format = CLAIMS_ANALYTICS.RAW.CSV_FF;


create or replace stage CLAIMS_ANALYTICS.RAW.CLAIMS_STAGE_B2
  file_format = CLAIMS_ANALYTICS.RAW.CSV_FF;

create or replace stage CLAIMS_ANALYTICS.RAW.CLAIMS_STAGE_B3
  file_format = CLAIMS_ANALYTICS.RAW.CSV_FF;

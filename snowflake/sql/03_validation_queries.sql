list @CLAIMS_ANALYTICS.RAW.CLAIMS_STAGE;
list @CLAIMS_ANALYTICS.RAW.REMITTANCES_STAGE;

select count(*) as claims_raw_count from CLAIMS_ANALYTICS.RAW.CLAIMS_RAW;
select count(*) as remittances_raw_count from CLAIMS_ANALYTICS.RAW.REMITTANCES_RAW;
select count(*) as accounts_raw_count from CLAIMS_ANALYTICS.RAW.ACCOUNTS_RAW;

select *
from table(
  information_schema.copy_history(
    table_name => 'CLAIMS_ANALYTICS.RAW.CLAIMS_RAW',
    start_time => dateadd('hour', -24, current_timestamp())
  )
);

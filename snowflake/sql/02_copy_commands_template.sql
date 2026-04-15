-- Update local file paths before running PUT commands.
-- Example paths below are Windows-style.

put file://C:/work/dbt-snowflake-enterprise-claims-analytics/data/claims.csv
  @CLAIMS_ANALYTICS.RAW.CLAIMS_STAGE auto_compress=true overwrite=true;

put file://C:/work/dbt-snowflake-enterprise-claims-analytics/data/remittances.csv
  @CLAIMS_ANALYTICS.RAW.REMITTANCES_STAGE auto_compress=true overwrite=true;

put file://C:/work/dbt-snowflake-enterprise-claims-analytics/data/accounts.csv
  @CLAIMS_ANALYTICS.RAW.ACCOUNTS_STAGE auto_compress=true overwrite=true;

put file://C:/work/dbt-snowflake-enterprise-claims-analytics/data/collectors.csv
  @CLAIMS_ANALYTICS.RAW.COLLECTORS_STAGE auto_compress=true overwrite=true;

put file://C:/work/dbt-snowflake-enterprise-claims-analytics/data/payers.csv
  @CLAIMS_ANALYTICS.RAW.PAYERS_STAGE auto_compress=true overwrite=true;

put file://C:/work/dbt-snowflake-enterprise-claims-analytics/data/facilities.csv
  @CLAIMS_ANALYTICS.RAW.FACILITIES_STAGE auto_compress=true overwrite=true;

put file://C:/work/dbt-snowflake-enterprise-claims-analytics/data/workqueue_actions.csv
  @CLAIMS_ANALYTICS.RAW.WORKQUEUE_ACTIONS_STAGE auto_compress=true overwrite=true;

copy into CLAIMS_ANALYTICS.RAW.CLAIMS_RAW
from @CLAIMS_ANALYTICS.RAW.CLAIMS_STAGE
file_format = (format_name = CLAIMS_ANALYTICS.RAW.CSV_FF)
pattern = '.*claims.*[.]csv([.]gz)?'
on_error = 'ABORT_STATEMENT';

copy into CLAIMS_ANALYTICS.RAW.REMITTANCES_RAW
from @CLAIMS_ANALYTICS.RAW.REMITTANCES_STAGE
file_format = (format_name = CLAIMS_ANALYTICS.RAW.CSV_FF)
pattern = '.*remittances.*[.]csv([.]gz)?'
on_error = 'ABORT_STATEMENT';

copy into CLAIMS_ANALYTICS.RAW.ACCOUNTS_RAW
from @CLAIMS_ANALYTICS.RAW.ACCOUNTS_STAGE
file_format = (format_name = CLAIMS_ANALYTICS.RAW.CSV_FF)
pattern = '.*accounts.*[.]csv([.]gz)?'
on_error = 'ABORT_STATEMENT';

copy into CLAIMS_ANALYTICS.RAW.COLLECTORS_RAW
from @CLAIMS_ANALYTICS.RAW.COLLECTORS_STAGE
file_format = (format_name = CLAIMS_ANALYTICS.RAW.CSV_FF)
pattern = '.*collectors.*[.]csv([.]gz)?'
on_error = 'ABORT_STATEMENT';

copy into CLAIMS_ANALYTICS.RAW.PAYERS_RAW
from @CLAIMS_ANALYTICS.RAW.PAYERS_STAGE
file_format = (format_name = CLAIMS_ANALYTICS.RAW.CSV_FF)
pattern = '.*payers.*[.]csv([.]gz)?'
on_error = 'ABORT_STATEMENT';

copy into CLAIMS_ANALYTICS.RAW.FACILITIES_RAW
from @CLAIMS_ANALYTICS.RAW.FACILITIES_STAGE
file_format = (format_name = CLAIMS_ANALYTICS.RAW.CSV_FF)
pattern = '.*facilities.*[.]csv([.]gz)?'
on_error = 'ABORT_STATEMENT';

copy into CLAIMS_ANALYTICS.RAW.WORKQUEUE_ACTIONS_RAW
from @CLAIMS_ANALYTICS.RAW.WORKQUEUE_ACTIONS_STAGE
file_format = (format_name = CLAIMS_ANALYTICS.RAW.CSV_FF)
pattern = '.*workqueue_actions.*[.]csv([.]gz)?'
on_error = 'ABORT_STATEMENT';

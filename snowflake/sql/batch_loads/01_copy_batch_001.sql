copy into CLAIMS_ANALYTICS.RAW.FACILITIES_RAW
from @CLAIMS_ANALYTICS.RAW.FACILITIES_STAGE
pattern='.*facilities.*'
file_format=(format_name=CLAIMS_ANALYTICS.RAW.CSV_FF)
on_error='abort_statement';

copy into CLAIMS_ANALYTICS.RAW.PAYERS_RAW
from @CLAIMS_ANALYTICS.RAW.PAYERS_STAGE
pattern='.*payers.*'
file_format=(format_name=CLAIMS_ANALYTICS.RAW.CSV_FF)
on_error='abort_statement';

copy into CLAIMS_ANALYTICS.RAW.COLLECTORS_RAW
from @CLAIMS_ANALYTICS.RAW.COLLECTORS_STAGE
pattern='.*collectors.*'
file_format=(format_name=CLAIMS_ANALYTICS.RAW.CSV_FF)
on_error='abort_statement';

copy into CLAIMS_ANALYTICS.RAW.ACCOUNTS_RAW
from @CLAIMS_ANALYTICS.RAW.ACCOUNTS_STAGE
pattern='.*accounts.*'
file_format=(format_name=CLAIMS_ANALYTICS.RAW.CSV_FF)
on_error='abort_statement';

copy into CLAIMS_ANALYTICS.RAW.CLAIMS_RAW
from @CLAIMS_ANALYTICS.RAW.CLAIMS_STAGE
pattern='.*claims.*'
file_format=(format_name=CLAIMS_ANALYTICS.RAW.CSV_FF)
on_error='abort_statement';

copy into CLAIMS_ANALYTICS.RAW.REMITTANCES_RAW
from @CLAIMS_ANALYTICS.RAW.REMITTANCES_STAGE
pattern='.*remittances.*'
file_format=(format_name=CLAIMS_ANALYTICS.RAW.CSV_FF)
on_error='abort_statement';

copy into CLAIMS_ANALYTICS.RAW.WORKQUEUE_ACTIONS_RAW
from @CLAIMS_ANALYTICS.RAW.WORKQUEUE_ACTIONS_STAGE
pattern='.*workqueue_actions.*'
file_format=(format_name=CLAIMS_ANALYTICS.RAW.CSV_FF)
on_error='abort_statement';
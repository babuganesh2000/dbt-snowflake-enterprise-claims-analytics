copy into CLAIMS_ANALYTICS.RAW.ACCOUNTS_RAW
from @CLAIMS_ANALYTICS.RAW.CLAIMS_STAGE_B3
pattern='.*accounts.*'
file_format=(format_name=CLAIMS_ANALYTICS.RAW.CSV_FF)
on_error='abort_statement';

copy into CLAIMS_ANALYTICS.RAW.CLAIMS_RAW
from @CLAIMS_ANALYTICS.RAW.CLAIMS_STAGE_B3
pattern='.*claims.*'
file_format=(format_name=CLAIMS_ANALYTICS.RAW.CSV_FF)
on_error='abort_statement';

copy into CLAIMS_ANALYTICS.RAW.REMITTANCES_RAW
from @CLAIMS_ANALYTICS.RAW.CLAIMS_STAGE_B3
pattern='.*remittances.*'
file_format=(format_name=CLAIMS_ANALYTICS.RAW.CSV_FF)
on_error='abort_statement';

copy into CLAIMS_ANALYTICS.RAW.WORKQUEUE_ACTIONS_RAW
from @CLAIMS_ANALYTICS.RAW.CLAIMS_STAGE_B3
pattern='.*workqueue_actions.*'
file_format=(format_name=CLAIMS_ANALYTICS.RAW.CSV_FF)
on_error='abort_statement';
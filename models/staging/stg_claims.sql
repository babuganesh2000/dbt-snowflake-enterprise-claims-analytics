select
    claim_id::number as claim_id,
    account_id::number as account_id,
    facility_id::number as facility_id,
    payer_id::number as payer_id,
    service_date::date as service_date,
    billed_amount::number(18,2) as billed_amount,
    upper(trim(claim_status)) as claim_status,
    load_ts::timestamp_ntz as load_ts,
    batch_id::number as batch_id,
    src_file_name::varchar as src_file_name
from {{ source('raw', 'claims_raw') }}

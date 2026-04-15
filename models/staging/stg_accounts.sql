select
    account_id::number as account_id,
    patient_id::number as patient_id,
    facility_id::number as facility_id,
    current_balance::number(18,2) as current_balance,
    assignment_status::varchar as assignment_status,
    collector_id::number as collector_id,
    queue_name::varchar as queue_name,
    updated_at::timestamp_ntz as updated_at,
    load_ts::timestamp_ntz as load_ts
from {{ source('raw', 'accounts_raw') }}

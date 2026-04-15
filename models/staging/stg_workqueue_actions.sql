select
    action_id::number as action_id,
    account_id::number as account_id,
    collector_id::number as collector_id,
    action_date::date as action_date,
    action_type::varchar as action_type,
    note_count::number as note_count,
    worked_flag::varchar as worked_flag
from {{ source('raw', 'workqueue_actions_raw') }}

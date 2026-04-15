{% snapshot collector_assignment_snapshot %}

{{
    config(
        target_schema='SNAPSHOT',
        unique_key='account_id',
        strategy='check',
        check_cols=['collector_id', 'assignment_status', 'queue_name']
    )
}}

select
    account_id,
    collector_id,
    assignment_status,
    queue_name,
    updated_at
from {{ ref('stg_accounts') }}

{% endsnapshot %}

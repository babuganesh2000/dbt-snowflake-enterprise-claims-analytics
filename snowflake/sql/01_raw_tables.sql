create or replace table CLAIMS_ANALYTICS.RAW.CLAIMS_RAW (
    claim_id number,
    account_id number,
    facility_id number,
    payer_id number,
    service_date date,
    billed_amount number(18,2),
    claim_status varchar,
    load_ts timestamp_ntz,
    batch_id number,
    src_file_name varchar
);

create or replace table CLAIMS_ANALYTICS.RAW.REMITTANCES_RAW (
    remit_id number,
    claim_id number,
    payment_date date,
    paid_amount number(18,2),
    adjustment_amount number(18,2),
    carc_code varchar,
    rarc_code varchar,
    remit_status varchar,
    load_ts timestamp_ntz,
    batch_id number,
    src_file_name varchar
);

create or replace table CLAIMS_ANALYTICS.RAW.ACCOUNTS_RAW (
    account_id number,
    patient_id number,
    facility_id number,
    current_balance number(18,2),
    assignment_status varchar,
    collector_id number,
    queue_name varchar,
    updated_at timestamp_ntz,
    load_ts timestamp_ntz
);

create or replace table CLAIMS_ANALYTICS.RAW.COLLECTORS_RAW (
    collector_id number,
    collector_name varchar,
    manager_name varchar,
    region varchar,
    active_flag varchar
);

create or replace table CLAIMS_ANALYTICS.RAW.PAYERS_RAW (
    payer_id number,
    payer_name varchar,
    payer_category varchar,
    contract_type varchar
);

create or replace table CLAIMS_ANALYTICS.RAW.FACILITIES_RAW (
    facility_id number,
    facility_name varchar,
    state varchar,
    region varchar
);

create or replace table CLAIMS_ANALYTICS.RAW.WORKQUEUE_ACTIONS_RAW (
    action_id number,
    account_id number,
    collector_id number,
    action_date date,
    action_type varchar,
    note_count number,
    worked_flag varchar
);

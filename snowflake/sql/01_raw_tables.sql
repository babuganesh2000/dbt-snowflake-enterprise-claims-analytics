create or replace table CLAIMS_ANALYTICS.RAW.ACCOUNTS_RAW (
    account_id number(38,0),
    patient_id number(38,0),
    facility_id number(38,0),
    current_balance number(18,2),
    assignment_status varchar,
    collector_id number(38,0),
    queue_name varchar,
    updated_at timestamp_ntz,
    load_ts timestamp_ntz,
    batch_id varchar,
    src_file_name varchar
);

create or replace table CLAIMS_ANALYTICS.RAW.CLAIMS_RAW (
    claim_id number(38,0),
    account_id number(38,0),
    facility_id number(38,0),
    payer_id number(38,0),
    service_date date,
    billed_amount number(18,2),
    claim_status varchar,
    load_ts timestamp_ntz,
    batch_id varchar,
    src_file_name varchar
);

create or replace table CLAIMS_ANALYTICS.RAW.REMITTANCES_RAW (
    remit_id number(38,0),
    claim_id number(38,0),
    payment_date date,
    paid_amount number(18,2),
    adjustment_amount number(18,2),
    carc_code varchar,
    rarc_code varchar,
    remit_status varchar,
    load_ts timestamp_ntz,
    batch_id varchar,
    src_file_name varchar
);

create or replace table CLAIMS_ANALYTICS.RAW.WORKQUEUE_ACTIONS_RAW (
    action_id number(38,0),
    account_id number(38,0),
    collector_id number(38,0),
    action_date date,
    action_type varchar,
    note_count number(38,0),
    worked_flag varchar,
    load_ts timestamp_ntz,
    batch_id varchar,
    src_file_name varchar
);


create or replace table CLAIMS_ANALYTICS.RAW.FACILITIES_RAW (
    facility_id number(38,0),
    facility_name varchar,
    state varchar,
    region varchar
);


create or replace table CLAIMS_ANALYTICS.RAW.PAYERS_RAW (
    payer_id number(38,0),
    payer_name varchar,
    payer_category varchar,
    contract_type varchar
);


create or replace table CLAIMS_ANALYTICS.RAW.COLLECTORS_RAW (
    collector_id number(38,0),
    collector_name varchar,
    manager_name varchar,
    region varchar,
    active_flag varchar
);



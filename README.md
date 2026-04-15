# dbt-snowflake-enterprise-claims-analytics

Enterprise-style dbt + Snowflake portfolio project that uses Snowflake `COPY INTO` for raw ingestion and dbt for transformation.

## Architecture

CSV files  
→ Snowflake stage  
→ `COPY INTO` RAW tables  
→ dbt `source()`  
→ staging  
→ intermediate  
→ marts  
→ snapshots

## What this project demonstrates

- Snowflake file ingestion with `PUT` + `COPY INTO`
- Clear separation of ingestion and transformation
- dbt sources, refs, staging, intermediate, marts
- Incremental model for AR aging snapshot
- Snapshot for collector assignment history
- Generic tests and unit tests
- Contracts on BI-facing marts
- GitHub Actions CI/CD

## Folder highlights

- `snowflake/sql/` contains Snowflake setup and load SQL
- `models/` contains dbt transformations
- `scripts/` contains synthetic data generation
- `.github/workflows/` contains CI/CD workflows

## Local build flow

1. Generate synthetic files
2. Run Snowflake setup SQL
3. Upload files to stage with `PUT`
4. Load RAW tables with `COPY INTO`
5. Run dbt

See `docs/STEP_BY_STEP.md` for exact instructions.
# dbt-snowflake-enterprise-claims-analytics

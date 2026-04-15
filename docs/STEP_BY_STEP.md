# Step by step: add this project to your repo

## 1. Create or open your GitHub repo locally

```bash
git clone https://github.com/<your-user>/<your-repo>.git
cd <your-repo>
```

If the repo does not exist yet:

```bash
mkdir dbt-snowflake-enterprise-claims-analytics
cd dbt-snowflake-enterprise-claims-analytics
git init
git branch -M main
```

## 2. Copy this starter pack into the repo root

Copy all files from the zip into the root of your repository.

Expected top-level folders:
- `.github/`
- `docs/`
- `macros/`
- `models/`
- `scripts/`
- `snapshots/`
- `snowflake/`
- `tests/`

## 3. Create Python environment

```bash
python -m venv .venv
source .venv/bin/activate
```

Windows PowerShell:

```powershell
python -m venv .venv
.venv\Scripts\activate
```

## 4. Install dependencies

```bash
pip install -r requirements.txt
```

## 5. Create your local dbt profile

Copy `profiles.yml.example` into your dbt profiles directory as `profiles.yml`.

Typical locations:
- Mac/Linux: `~/.dbt/profiles.yml`
- Windows: `%USERPROFILE%\.dbt\profiles.yml`

Then set these environment variables:
- `SNOWFLAKE_ACCOUNT`
- `SNOWFLAKE_USER`
- `SNOWFLAKE_PASSWORD`
- `SNOWFLAKE_ROLE`
- `SNOWFLAKE_DATABASE`
- `SNOWFLAKE_WAREHOUSE`
- optionally `SNOWFLAKE_SCHEMA`

## 6. Generate synthetic input files

```bash
python scripts/generate_synthetic_data.py
```

This creates CSV files under `data/`.

## 7. Run Snowflake setup SQL

Run these files in Snowflake, in this order:

1. `snowflake/sql/00_setup.sql`
2. `snowflake/sql/01_raw_tables.sql`
3. `snowflake/sql/02_copy_commands_template.sql`

## 8. Upload files to internal stages

Use SnowSQL or Snowflake worksheet `PUT` commands from `02_copy_commands_template.sql`.

If you are on Windows, update the local paths first.

## 9. Load RAW tables with `COPY INTO`

Run the `COPY INTO` statements from `02_copy_commands_template.sql`.

## 10. Validate load history

Run `snowflake/sql/03_validation_queries.sql`.

## 11. Install dbt packages

```bash
dbt deps
```

## 12. Validate connection

```bash
dbt debug --target dev
```

## 13. Build dbt layers

```bash
dbt run --select staging --target dev
dbt run --select intermediate --target dev
dbt run --select marts --target dev
dbt snapshot --target dev
dbt test --target dev
dbt test --select test_type:unit --target dev
dbt docs generate --target dev
```

## 14. Commit to GitHub

```bash
git add .
git commit -m "Add dbt Snowflake claims analytics starter project"
git push origin main
```

## 15. Add GitHub repo secrets

In GitHub repo settings, add:
- `SNOWFLAKE_ACCOUNT`
- `SNOWFLAKE_USER`
- `SNOWFLAKE_PASSWORD`
- `SNOWFLAKE_ROLE`
- `SNOWFLAKE_DATABASE`
- `SNOWFLAKE_WAREHOUSE`

## 16. Open a PR to test CI

Make a small change in a model, push a branch, and open a pull request.
That should trigger `.github/workflows/ci.yml`.

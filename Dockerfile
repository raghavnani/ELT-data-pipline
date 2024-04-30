FROM quay.io/astronomer/astro-runtime:11.2.0

# Install venv and the dbt snowflake package
RUN python3 -m venv dbt_venv && source dbt_venv/bin/activate && pip install dbt-snowflake && deactivate



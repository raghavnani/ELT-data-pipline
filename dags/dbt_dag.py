import os
from datetime import datetime

from cosmos import DbtDag, ProjectConfig, ProfileConfig, ExecutionConfig
from cosmos.profiles import SnowflakeUserPasswordProfileMapping


# Define the profle configuration
profile_config = ProfileConfig(
    profile_name="default",
    target_name="dev",
    profile_mapping=SnowflakeUserPasswordProfileMapping(
        conn_id="snowflake_conn",
        profile_args={
            "database": "dbt_db",
            "schema": "dbt_schema",
        },
    ),
)

# Define the DbtDag configuration

dbt_snowflake_dag = DbtDag(
    dag_id="dbt_snowflake_dag",
    project_config=ProjectConfig(os.path.join(os.path.dirname(__file__), "dbt/data_pipeline")),
        operator_args={"install_deps": True},
        profile_config=profile_config,
        execution_config=ExecutionConfig(
            dbt_executable_path=f"{os.environ['AIRFLOW_HOME']}/dbt_venv/bin/dbt",),
            start_date=datetime(2024, 4, 29),
            schedule_interval="@daily",
            catchup=False
)
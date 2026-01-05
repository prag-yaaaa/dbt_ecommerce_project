## This DAG file is used to schedule and run dbt transformations for the e-commerce project in AIRFLOW.
## The location of this file should be always within ~/airflow/dags/dbt/, and the naming format is dbt_dag.py

from airflow import DAG
from airflow.providers.standard.operators.bash import BashOperator
from datetime import datetime, timedelta

default_args = {
    'owner': 'pragya',
    'depends_on_past': False,
    'start_date': datetime(2024, 9, 20),
    'retries': 1,
    'retry_delay': timedelta(minutes=1),
    'sla': timedelta(hours=1), # Set SLA to 1 hour for the task : Service Level Agreement
}

with DAG(
    'dbt_ecommerce_dag',
    default_args=default_args,
    description='DBT DAG for E-commerce Data Transformation',
    schedule='@daily',
    catchup=False,
) as dag:

    dbt_run = BashOperator(
        task_id='dbt_ecommerce_dag',
        bash_command="""
        set -e
        source /Users/pragya/Desktop/dbt_ecommerce_project/venv/bin/activate
        cd /Users/pragya/Desktop/dbt_ecommerce_project/ecommerce
        dbt debug
        dbt run
        """,
        env={'DBT_PROFILES_DIR': '/Users/pragya/.dbt'},
    )

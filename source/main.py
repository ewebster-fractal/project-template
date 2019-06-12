import argparse

from datetime import timedelta

import airflow
from airflow.models import DAG
from airflow.operators.python_operator import PythonOperator

import mlflow

# dag = DAG(
#     dag_id='my_first_dag',
#     schedule_interval='* * * * *',
#     dagrun_timeout=timedelta(minutes=60)
# )

# my_operator = PythonOperator(
#     task_id='hello_world',
#     dag=dag
# )

# run_this_last = DummyOperator(
#     task_id='run_this_last',
#     dag=dag,
# )

# my_operator >> run_this_last

def hello(name):
    print("Hello, {}. Nice to meet you.".format(name))

if __name__ == '__main__':

    parser = argparse.ArgumentParser()
    parser.add_argument('name', type=str, help='name to greet')

    args = parser.parse_args()
    print(args)
    name = args.name

    # dag.cli()
    with mlflow.start_run():
        mlflow.log_param('name', name)

        hello(name)
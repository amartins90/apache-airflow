#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# If file exists.
# if [ -e "/opt/airflow/requirements.txt" ]; then
#     $(command python) pip install --upgrade pip
#     $(command -v pip) install --user -r requirements.txt
# fi

# If file NOT exists and is a regular file.
if [ ! -f "/opt/airflow/airflow.db" ]; then
    airflow db init && \
    airflow users create \
        --username admin \
        --firstname admin \
        --lastname admin \
        --role Admin \
        --email admin@example.com \
        --password admin
fi

$(command -v airflow) db upgrade

exec airflow webserver
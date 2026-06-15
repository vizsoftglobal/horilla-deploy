#!/bin/bash
set -euo pipefail

python3 manage.py makemigrations --noinput
python3 manage.py migrate --noinput
python3 manage.py collectstatic --noinput
exec gunicorn --bind "0.0.0.0:${PORT:-8000}" horilla.wsgi:application

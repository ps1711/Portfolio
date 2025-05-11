#!/bin/bash

# Attempt to locate the virtual environment activation script
VENV_ACTIVATE=$(find /opt/python -name "activate" -type f -print -quit)

if [ -n "$VENV_ACTIVATE" ]; then
  echo "Activating virtual environment: $VENV_ACTIVATE"
  source "$VENV_ACTIVATE"
else
  echo "Error: Virtual environment activation script not found."
  exit 1
fi

# Now that the virtual environment is activated, pip and python should be in PATH
pip install -r requirements.txt
python manage.py collectstatic --noinput
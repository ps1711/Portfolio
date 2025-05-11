#!/bin/bash

PYTHON_EXECUTABLE=$(which python3)

if [ -n "$PYTHON_EXECUTABLE" ]; then
  echo "Using Python executable: $PYTHON_EXECUTABLE"
  "$PYTHON_EXECUTABLE" -m pip install -r requirements.txt
  # Explicitly install Django again
  "$PYTHON_EXECUTABLE" -m pip install Django
  "$PYTHON_EXECUTABLE" manage.py collectstatic --noinput
else
  echo "Error: Python executable not found in PATH."
  exit 1
fi
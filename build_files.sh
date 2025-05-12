#!/bin/bash

PYTHON_EXECUTABLE=$(which python3)

if [ -n "$PYTHON_EXECUTABLE" ]; then
  echo "Using Python executable: $PYTHON_EXECUTABLE"
  "$PYTHON_EXECUTABLE" -m pip install --upgrade -r requirements.txt
  # Explicitly install Django again (with upgrade)
  "$PYTHON_EXECUTABLE" -m pip install --upgrade Django
  "$PYTHON_EXECUTABLE" -m pip install --upgrade pip
  # Capture output and check for errors
  echo "Running collectstatic..."
  "$PYTHON_EXECUTABLE" manage.py collectstatic --noinput
  if [ $? -ne 0 ]; then
    echo "Error: collectstatic failed."
    exit 1
  fi
else
  echo "Error: Python executable not found in PATH."
  exit 1
fi

#!/bin/bash

# Attempt to locate the virtual environment activation script in common venv directories
VENV_ACTIVATE=$(find / -name "activate" -type f \( -path "*/venv/bin/*" -o -path "*/.venv/bin/*" \) -print -quit)

if [ -n "$VENV_ACTIVATE" ]; then
  echo "Activating virtual environment: $VENV_ACTIVATE"
  source "$VENV_ACTIVATE"
else
  echo "Error: Virtual environment activation script not found in common locations."
  # As a fallback, let's try sourcing the one we found earlier, in case it helps partially
  PREVIOUS_VENV="/usr/lib64/python3.9/venv/scripts/common/activate"
  if [ -f "$PREVIOUS_VENV" ]; then
    echo "Fallback: Trying to source the previously found activation script."
    source "$PREVIOUS_VENV"
  else
    echo "Fallback activation script also not found."
    exit 1
  fi
fi

# Now that the virtual environment is activated, pip and python should be in PATH
pip install -r requirements.txt
python manage.py collectstatic --noinput
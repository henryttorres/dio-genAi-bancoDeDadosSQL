#!/bin/sh
cd "$(dirname "$0")" || exit 1
python3 -m venv .venv
. .venv/bin/activate
python -m pip install -r requirements.txt
python app.py

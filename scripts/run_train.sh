#!/usr/bin/env bash
# Wrapper simple para lanzar el bucle de fine-tuning.
# Usa todos los argumentos que le pases (config, flags, etc.).
set -e
poetry run python -m src.models.train "$@"

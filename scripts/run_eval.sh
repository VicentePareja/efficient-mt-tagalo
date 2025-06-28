#!/usr/bin/env bash
# Genera traducciones en batch y calcula BLEU + chrF.
set -e
poetry run python -m src.evaluation.eval_metrics "$@"

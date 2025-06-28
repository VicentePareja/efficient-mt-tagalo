# Efficient MT Tagalog  🇵🇭🚀

Fine‑tuning eficiente de **NLLB‑200** al tagalo mediante **LoRA**
Proyecto grupal – UC Chile 2025

[![ci](https://github.com/VicentePareja/efficient-mt-tagalo/actions/workflows/ci.yml/badge.svg)](https://github.com/VicentePareja/efficient-mt-tagalo/actions/workflows/ci.yml)

---

## Objetivo

Adaptar NLLB‑200 al tagalo usando ≤3 k ejemplos del corpus **FLORES‑200 (inglés‑tagalo)** para mejorar la traducción automática en escenarios *low‑resource*, aplicando **LoRA** (PEFT).
Este repositorio documenta y contiene los **Avances de implementación** ya logrados: infraestructura mínima, scripts de datos, esqueleto de entrenamiento, métricas BLEU/chrF, etc.

---

## Estructura de carpetas

```text
src/         # Código importable
data/        # (ignorado) corpus y procesados
data/raw/    # Archivos originales de FLORES‑200
data/processed/  # Tokenizado y splits
data/tokenizers/ # Modelos SentencePiece
configs/     # YAMLs de hiperparámetros/notebooks
notebooks/   # Exploración y sanity checks
experiments/ # Checkpoints & logs
docs/        # Material adicional (si fuera necesario)
```

---

## Instalación rápida

> Requiere **Python ≥3.10** y **Poetry**.

```bash
git clone git@github.com:VicentePareja/efficient-mt-hindi.git
cd efficient-mt-hindi
poetry install --all-extras
```

### Primer test de humo

```bash
# 1) Descarga y verifica FLORES‑200 (inglés‑tagalo)
poetry run python src/data/download_flores.py --verify

# 2) Entrenamiento LoRA "en seco" para revisar que todo compile
poetry run python src/models/train.py \
  --config configs/lora_default.yaml \
  --dry-run

# 3) Métricas dummy sobre predicciones de prueba
poetry run python src/evaluation/eval_metrics.py \
  --pred outputs/sample_hyp.txt
```

---

## Uso con Docker (opcional)

```bash
# Construye la imagen (CUDA 12.1 base — ajústalo según tu driver)
docker build -t efficient-mt-tl .

# Inicia un contenedor con acceso a GPU
docker run --gpus all -it --rm -v $(pwd):/workspace efficient-mt-tl bash
```

---

## Flujo de trabajo y contribuciones

1. Crea rama `feature/<tema>` a partir de **dev**.
2. Ejecuta `pre-commit run --all-files` antes de hacer *commit*.
3. Abre un Pull Request hacia **dev** → requiere al menos 1 revisión y CI verde.
4. Merge *squash* para mantener historial limpio.

> **CI:** El workflow `ci.yml` (GitHub Actions) instala dependencias, ejecuta `ruff`, `black --check` y tests (`pytest`).

---

## Licencia

MIT License © 2025

---

## Créditos

Samuelle Arratia · Justo Solís · Vicente Pareja · Camilo Romero

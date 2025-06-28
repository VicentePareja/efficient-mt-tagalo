# Efficient MT Tagalog  🇵🇭🚀

Fine‑tuning eficiente de **NLLB‑200** al tagalo mediante **LoRA**
Proyecto grupal – UC Chile 2025

[![CI](https://github.com/VicentePareja/efficient-mt-hindi/actions/workflows/ci.yml/badge.svg)](https://github.com/VicentePareja/efficient-mt-hindi/actions/workflows/ci.yml)

---

## Objetivo

Adaptar **NLLB‑200** al tagalo usando ≤ 3 k ejemplos del corpus **FLORES‑200 (inglés‑tagalo)** para mejorar la traducción automática en escenarios *low‑resource*, mediante **LoRA** (PEFT).
Este repositorio refleja los **Avances de implementación** ya alcanzados: infraestructura mínima, scripts de datos, esqueleto de entrenamiento y evaluación automática (BLEU / chrF).

---

## Estructura de carpetas

```text
src/                    # Código importable
│
├─ data/                # (ignorado por git)
│   ├─ raw/             # FLORES‑200 original
│   ├─ processed/       # Tokenizado y splits
│   └─ tokenizers/      # Modelos SentencePiece
│
├─ configs/             # YAMLs (hiperparámetros, rutas)
├─ notebooks/           # Exploración y sanity checks
├─ experiments/         # Checkpoints & logs => exp/<fecha>_<descripción>
├─ scripts/             # Wrappers CLI (train / eval)
└─ docs/                # Material adicional si aplica
```

---

## Instalación rápida

> Requiere **Python ≥ 3.10** y **Poetry**.

```bash
git clone git@github.com:VicentePareja/efficient-mt-hindi.git
cd efficient-mt-hindi
poetry install --all-extras
```

### Smoke test

```bash
# 1) Descarga y verifica FLORES‑200 (inglés‑tagalo)
poetry run python src/data/download_flores.py --verify

# 2) Entrenamiento LoRA "en seco" (–dry‑run) para chequear el pipeline
poetry run python src/models/train.py --config configs/lora_default.yaml --dry-run

# 3) Métricas dummy sobre predicciones de prueba
poetry run python src/evaluation/eval_metrics.py \
  --pred outputs/sample_hyp.txt --ref data/processed/test.tgl.txt
```

---

## Uso con Docker

```bash
make up      # construye la imagen y levanta el contenedor en segundo plano
make bash    # ingresa al contenedor (service: mt)
make down    # detiene y limpia
```

La imagen se basa en **python:3.10‑slim**; si tu host tiene GPU con NVIDIA runtime, se habilita automáticamente.

---

## Flujo de trabajo y contribuciones

| Tema                                                                      | Regla                                                   | Ejemplo            |
| ------------------------------------------------------------------------- | ------------------------------------------------------- | ------------------ |
| **Branches**                                                              | • **main**: estable y protegida                         |                    |
| • **dev**: integración continua                                           |                                                         |                    |
| • **feature/**\*: desarrollo de tareas                                    | `feature/tokenizer-refactor`                            |                    |
| **Commits**                                                               | *Conventional Commits* — prefijos:                      |                    |
| `feat:`, `fix:`, `docs:`, `build:`, `ci:`, `test:`, `refactor:`, `chore:` | `feat(models): add LoRA injection helper`               |                    |
| **Pull Requests**                                                         | Abrir PR → **dev**.                                     |                    |
| Requisitos: ≥ 1 revisión aprobada **y CI verde** (ruff + black + tests).  |                                                         |                    |
| Se aplica *squash & merge* para historial limpio.                         | —                                                       |                    |
| **Experiments**                                                           | Cada corrida crea carpeta en `experiments/` con patrón: |                    |
| `YYYY‑MM‑DD_<breve‑descripción>`                                          | `experiments/2025‑07‑02_lora_r8_bs32`                   |                    |
| **Etiquetas**                                                             | Releases anotadas con *semver* + sufijo descriptivo     | `v0.1.0-infra-mvp` |

> **Checklist antes de enviar un PR**
>
> 1. `pre-commit run --all-files` sin errores.
> 2. Descripción clara de la tarea y cambios.
> 3. Docs/README actualizados si aplica.

---

## CI

El workflow [`ci.yml`](.github/workflows/ci.yml) ejecuta:

1. Instalación de dependencias vía Poetry.
2. `ruff .` — linting.
3. `black --check .` — formato.
4. `pytest -q` — tests (placeholder).

---

## Licencia

MIT License © 2025 — Equipo Efficient MT Tagalog

---

## Créditos

Samuelle Arratia ─ Justo Solís ─ Vicente Pareja ─ Camilo Romero

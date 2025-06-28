Efficient MT Tagalog 🇵🇭🚀

Fine‑tuning eficiente de NLLB‑200 al tagalo mediante LoRA
Proyecto grupal – UC Chile 2025


⸻

Objetivo

Adaptar NLLB‑200 al tagalo usando ≤ 3 k ejemplos del corpus FLORES‑200 (inglés‑tagalo) para mejorar la traducción automática en entornos low‑resource, aplicando LoRA (PEFT).
Este repositorio contiene los Avances de implementación completados hasta ahora: infraestructura mínima reproducible, scripts de datos, esqueleto de entrenamiento y evaluación automática (BLEU / chrF).

⸻

Estructura de carpetas

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


⸻

Guía de instalación y ejecución para nuevos colaboradores

Requisitos mínimos
• Python ≥ 3.10
• Poetry ≥ 1.8
• (🔧 Opcional) Docker & Docker Compose si prefieres contenedor

# 1 – Clonar el repositorio
$ git clone git@github.com:VicentePareja/efficient-mt-hindi.git
$ cd efficient-mt-hindi

# 2 – Instalar dependencias en modo usuario
$ poetry install --all-extras          # añade deps + extras de dev

# 3 – Activar el entorno
$ poetry shell                          # (o anteponer poetry run <cmd>)

Smoke test rápido

# A. Descarga / verifica el corpus FLORES‑200
(efficient-mt)$ python src/data/download_flores.py --verify

# B. Entrenamiento LoRA "en seco" (–dry‑run)
(efficient-mt)$ python src/models/train.py \
              --config configs/lora_default.yaml --dry-run

# C. Métricas dummy (BLEU / chrF) sobre un archivo de ejemplo
(efficient-mt)$ python src/evaluation/eval_metrics.py \
              --pred outputs/sample_hyp.txt \
              --ref  data/processed/test.tgl.txt

Si los tres pasos terminan sin errores de importación, tu entorno está listo 💪.

Ejecución con Docker (alternativa 100 % reproducible)

# Build + up
$ make up          # construye la imagen y levanta el contenedor en segundo plano

# Acceso interactivo
$ make bash        # entra a /app dentro del contenedor (service: mt)

# Limpieza
$ make down

La imagen parte de python:3.10‑slim.
Si tu host dispone de GPU con runtime NVIDIA, Docker Compose la detecta y habilita automáticamente.

⸻

Flujo de trabajo y convenciones de equipo

Tema	Regla	Ejemplo
Branches	• main: estable / protegida  • dev: integración contínua  • feature/*: trabajo por tarea	feature/tokenizer-refactor
Commits	Conventional Commits → feat:, fix:, docs:, ci:, refactor:, test:, chore:	feat(models): add LoRA injection helper
Pull Requests	Abrir contra dev  → ≥ 1 review aprobada y CI verde	—
Squash merge	Historial limpio una vez aprobado el PR	—
Experiments	Carpeta por corrida: experiments/YYYY‑MM‑DD_<breve‑descripción>	experiments/2025‑07‑02_lora_r8_bs32
Releases	Tags semver + sufijo descriptivo	v0.1.0‑infra‑mvp

Checklist antes del PR
	1.	pre-commit run --all-files sin errores.
	2.	Descripción clara de la tarea y cambios.
	3.	Documentación actualizada si aplica.

⸻

CI 🚦

El workflow ci.yml ejecuta automáticamente en cada push / PR:
	1.	Instalación de dependencias vía Poetry.
	2.	ruff . — linting.
	3.	black --check . — formato.
	4.	pytest -q — tests (placeholder).

⸻

Próximos pasos a implementar 🛠️

Prioridad	Tarea	Responsable	Issue / PR
🥇	Implementar descarga + checksum en download_flores.py
🥇	Crear train.py con HuggingFace Trainer + PEFT
🥈	Script de tokenización SentencePiece definitivo
🥈	Pipeline de evaluación completa (pred → sacrebleu)
🥉	Integrar TensorBoard / WandB
🥉	Añadir tests unitarios mínimos

(Actualiza la tabla en función de la asignación real en GitHub Issues)

⸻

Licencia

MIT License © 2025 — Equipo Efficient MT Tagalog

⸻

Créditos

Samuelle Arratia · Justo Solís · Vicente Pareja · Camilo Romero
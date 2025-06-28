# ───────────────────────── Dockerfile (CPU por defecto) ──────────────────────
FROM python:3.10-slim

# Instala Poetry
RUN pip install --no-cache-dir poetry==1.8.2

# Copia definiciones de dependencias antes del resto (mejor caché)
WORKDIR /app
COPY pyproject.toml poetry.lock* /app/

# Instala deps en la imagen global (sin virtualenv interno → más simple)
RUN poetry config virtualenvs.create false \
 && poetry install --no-root --only main

# Copia el proyecto completo
COPY . /app

# Acceso interactivo por defecto
ENTRYPOINT ["bash"]

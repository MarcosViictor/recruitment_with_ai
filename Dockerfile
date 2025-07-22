# Use a imagem oficial do Python como base
FROM python:3.11-slim

# Cria e define o diretório de trabalho
WORKDIR /app

# Instala dependências do sistema
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copia o arquivo de requisitos primeiro para aproveitar o cache de camadas
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia o projeto para o container
COPY . .

# Comando para rodar quando o container iniciar
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "core.wsgi:application"]
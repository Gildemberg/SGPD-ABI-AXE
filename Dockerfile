FROM python:3.11-slim

# Instalar dependências de sistema necessárias para compilação de pacotes Python
RUN apt-get update && apt-get install -y \
    pkg-config \
    libmariadb-dev \
    build-essential \
    libpq-dev

# Definir o diretório de trabalho
WORKDIR /app

# Copiar o arquivo de requisitos para o container
COPY requirements.txt .

# Atualizar pip para a versão mais recente
RUN pip install --upgrade pip

# Instalar as dependências Python
RUN pip install --no-cache-dir -r requirements.txt

# Copiar o código da aplicação para o container
COPY . .

# Definir o comando de execução do containers
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

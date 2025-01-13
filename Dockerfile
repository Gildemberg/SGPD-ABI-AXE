# Definir imagem base
FROM python:3.11-slim

# Instalar dependências de sistema para pacotes Python que necessitam de compilação
RUN apt-get update && apt-get install -y build-essential libpq-dev

# Definir o diretório de trabalho
WORKDIR /app

# Copiar o arquivo de requisitos para o container
COPY requirements.txt .

# Atualizar o pip para a versão mais recente
RUN pip install --upgrade pip

# Instalar dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copiar o código da aplicação para o container
COPY . .

# Definir o comando de execução do container
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

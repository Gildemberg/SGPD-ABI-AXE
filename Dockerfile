# Use uma imagem base leve com Python
FROM python:3.11-slim

# Atualize e instale dependências do sistema
RUN apt-get update && apt-get install -y \
    build-essential \
    default-libmysqlclient-dev \
    gcc \
    && apt-get clean

# Configure o diretório de trabalho no container
WORKDIR /app

# Copie os arquivos do projeto para o container
COPY . /app/

# Configure o ambiente virtual
RUN python -m venv /opt/venv

# Ative o ambiente virtual e instale as dependências
RUN /opt/venv/bin/pip install --upgrade pip
RUN /opt/venv/bin/pip install -r requirements.txt

# Adicione o ambiente virtual ao PATH
ENV PATH="/opt/venv/bin:$PATH"

# Comando padrão para iniciar o servidor
CMD ["gunicorn", "meu_projeto.wsgi:application", "--bind", "0.0.0.0:8000"]
# Use uma imagem base do Python
FROM python:3.11-slim

# Defina um diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie o arquivo de requisitos para dentro do contêiner
COPY requirements.txt /app/

# Instale as dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt

# Copie o código do projeto para dentro do contêiner
COPY . /app/

# Defina a variável de ambiente para produção
ENV DJANGO_SETTINGS_MODULE=core.settings.production

# Exponha a porta que o servidor irá rodar
EXPOSE 8000

# Comando para rodar o servidor Waitress
CMD ["python", "core/wsgi.py"]
g
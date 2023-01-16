#https://www.alirookie.com/post/azure-functions-with-docker-and-container-registry
FROM mcr.microsoft.com/azure-functions/python:4-python3.9

ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true

ARG FROM_ADDR
ARG PASSWORD

RUN apt-get update && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt .
RUN pip --no-cache-dir install -r /app/requirements.txt

COPY functions/. /home/site/wwwroot

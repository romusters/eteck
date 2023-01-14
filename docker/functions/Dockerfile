#https://www.alirookie.com/post/azure-functions-with-docker-and-container-registry
FROM mcr.microsoft.com/azure-functions/python:4-python3.10

ENV FROM_ADDR
ENV PASSWORD

RUN pip install -r email_schedule_trigger/requirements.txt

COPY . /home/site/wwwroot

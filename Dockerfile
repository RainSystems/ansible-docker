FROM python:2.7-alpine
RUN pip install ansible
RUN mkdir /app
WORKDIR /app
ENTRYPOINT ["ansible"]
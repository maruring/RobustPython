FROM python:3.9-slim

RUN apt-get update
RUN apt-get install -y

WORKDIR /root/src

RUN python -m pip install --upgrade pip
RUN python -m pip install jupyterlab mypy monkeytype PyYAML pydantic backoff pypubsub
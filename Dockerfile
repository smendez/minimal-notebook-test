FROM python:3.7-slim
RUN pip install --no-cache --upgrade pip && \
    pip install --no-cache notebook
ENV HOME=/tmp
WORKDIR ${HOME}

FROM python:3.7-slim
RUN pip install --no-cache --upgrade pip && \
    pip install --no-cache notebook

USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}
USER ${NB_USER}

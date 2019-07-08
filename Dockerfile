FROM python:3.7-slim
RUN pip install --no-cache --upgrade pip && \
    pip install --no-cache notebook && \
    pip install --no-cache jupyter_contrib_nbextensions

RUN jupyter contrib nbextension install --user && \
    jupyter nbextension install https://rawgithub.com/minrk/ipython_extensions/master/nbextensions/gist.js && \
    jupyter nbextension enable gist

ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
WORKDIR ${HOME}
USER ${USER}

COPY . ${HOME}

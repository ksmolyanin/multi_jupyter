FROM python:3
ENV PYTHONUNBUFFERED=1
EXPOSE 8888
WORKDIR /opt
RUN apt-get update -y
RUN apt-get install -y pandoc texlive-xetex texlive-fonts-recommended texlive-plain-generic
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs
RUN python -m pip install --upgrade pip
RUN pip install jupyterlab nbconvert sos sos-notebook jupyterlab-sos poetry
RUN python -m sos_notebook.install
RUN jupyter labextension install transient-display-data
RUN jupyter labextension install jupyterlab-sos
RUN npm install -g ijavascript
RUN ijsinstall
RUN poetry config virtualenvs.create false
COPY poetry.lock .
COPY pyproject.toml .
RUN poetry install
COPY jupyter_config/tracker.jupyterlab-settings /root/.jupyter/lab/user-settings/@jupyterlab/notebook-extension/
RUN mkdir notebooks

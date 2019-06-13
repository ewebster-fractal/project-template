FROM continuumio/miniconda3

RUN apt-get update && apt-get install -y \
    nano \
    git \
    freetds-dev \
    libkrb5-dev \
    libsasl2-dev \
    libssl-dev \
    libffi-dev \
    libpq-dev \  
    freetds-bin \  
    build-essential \
    default-libmysqlclient-dev \
    apt-utils \
    curl \
    rsync \
    netcat \
    locales \
    python-dev

# copy project assets to the docker container    
COPY ./source/ /tmp/source/
COPY initialize_conda_env.sh /tmp/initialize_conda_env.sh
COPY requirements.yml /tmp/requirements.yml
COPY project.yml /tmp/project.yml

EXPOSE 5000 8080 5555 8793

# create the conda environment
RUN ["chmod", "+x", "/tmp/initialize_conda_env.sh"]
RUN /tmp/initialize_conda_env.sh

ENV CONDA_ENV_NAME $(head -1 /tmp/requirements.yml | cut -d' ' -f2 | tr -d '\n')
#RUN echo "source activate $(head -1 /tmp/requirements.yml | cut -d' ' -f2 | tr -d '\n')" > ~/.bashrc
#ENV PATH /opt/conda/envs/airflow/bin:$PATH
#ENV PATH "/opt/conda/envs/$(head -1 /tmp/requirements.yml | cut -d' ' -f2)/bin:$PATH"
#RUN ["/bin/bash", "-c", "source activate airflow"]

#RUN ["mlflow run tmp/project.yml -P name=Edwin"]

#RUN /bin/bash -c "source activate $(head -1 /tmp/requirements.yml | cut -d' ' -f2)"

RUN ['conda', 'activate', ${CONDA_ENV_NAME}]
ENTRYPOINT [ "python", "/tmp/source/app.py"]
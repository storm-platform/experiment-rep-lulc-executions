FROM continuumio/miniconda3@sha256:7838d0ce65783b0d944c19d193e2e6232196bada9e5f3762dc7a9f07dc271179

WORKDIR /opt/experiment
COPY verification/requirements.txt /opt/experiment/requirements.txt

RUN pip install -r requirements.txt \
    && rm requirements.txt

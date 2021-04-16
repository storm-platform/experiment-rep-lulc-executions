#!/bin/bash

#
# run general classification script (with 2 classification process)
#
docker run -ti --name sits_classification_execution_experiment \
    -v ${PWD}/classification.R:/opt/classification/classification_script.R \
    -v ${PWD}/classification-results:/opt/classification/results \
    m3nin0/rep-lulc-executions:latest \
    Rscript classification_script.R && \
    docker rm sits_classification_execution_experiment

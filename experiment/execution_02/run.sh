#!/bin/bash

#
# run script A
#
docker run -ti --name sits_classification_execution_experiment \
    -v ${PWD}/classification_a.R:/opt/classification/classification_script.R \
    -v ${PWD}/classification-results:/opt/classification/results \
    m3nin0/rep-lulc-executions:latest \
    Rscript classification_script.R &&
    docker rm sits_classification_execution_experiment

#
# run script B
#
docker run -ti --name sits_classification_execution_experiment \
    -v ${PWD}/classification_b.R:/opt/classification/classification_script.R \
    -v ${PWD}/classification-results:/opt/classification/results \
    m3nin0/rep-lulc-executions:latest \
    Rscript classification_script.R &&
    docker rm sits_classification_execution_experiment

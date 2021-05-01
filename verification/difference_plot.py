#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import numpy as np

import rasterio as rio
import matplotlib.pyplot as plt
from matplotlib.lines import Line2D


def diff(array_01: np.ndarray, array_02: np.ndarray) -> np.ndarray:
    """Calcula a diferença entre duas matrizes categóricas
    """
    diff = array_01 - array_02

    diff[diff != 0] = 2
    diff[diff == 0] = 1
    diff[diff == 2] = 0

    return diff.astype(int)


def plot_difference_of_categorical_image(classification_map_array: np.ndarray,
                                         legend = ['Valor Igual', 'Valor Diferente']) -> plt.Figure:
    """Função para plotar a diferença entre dois mapas classificados 
  
    Args:
        classification_map_array (np.ndarray): array com as diferenças

        legend (list): Labels das legendas
        
    Returns:
        plt.Figure: Figura com a diferença calculada
    """
    
    # Quando todos os valores são iguais, troca apenas o valor do primeiro pixel para que o colormap
    # seja utilizado corretamente. Como resultado é utilizado para apresentação visual, nenhum tipo de
    # mudança nos resultados é realizado (Apenas um pixel é alterado)
    if classification_map_array[classification_map_array == 1].all():
        classification_map_array[0, 1] = 0

    fig = plt.figure(dpi = 300)
    plt.imshow(classification_map_array[0, :, :], cmap = 'tab20c', interpolation = 'none')

    plt.axis('off')
    frame1 = plt.gca()
    frame1.axes.xaxis.set_ticklabels([])
    frame1.axes.yaxis.set_ticklabels([])

    # legend
    cmap = plt.cm.tab20c
    custom_lines = [Line2D([0], [0], color=cmap(20), lw=2),
                    Line2D([0], [0], color=cmap(1), lw=2)]
    plt.legend(custom_lines, legend)

    return fig


# Experimento 01
map_execution01a = rio.open("experiment/execution_01/classification-results/experiment_01a/bdc_cube_probs_class_2018_8_2019_8_v1.tif")
map_execution01b = rio.open("experiment/execution_01/classification-results/experiment_01b/bdc_cube_probs_class_2018_8_2019_8_v1.tif")

arr_diff = diff(
    map_execution01a.read(),
    map_execution01b.read()
)

plot_difference_of_categorical_image(arr_diff)
plt.savefig('verification/results/experiment_01_diff.png', dpi=600, bbox_inches='tight', pad_inches=0.0)

# Experimento 02
map_execution02a = rio.open("experiment/execution_02/classification-results/experiment_02a/bdc_cube_probs_class_2018_8_2019_8_v1.tif")
map_execution02b = rio.open("experiment/execution_02/classification-results/experiment_02b/bdc_cube_probs_class_2018_8_2019_8_v1.tif")

arr_diff = diff(
    map_execution02a.read(),
    map_execution02b.read()
)

plot_difference_of_categorical_image(arr_diff)
plt.savefig('verification/results/experiment_02_diff.png', dpi=600, bbox_inches='tight', pad_inches=0.0)

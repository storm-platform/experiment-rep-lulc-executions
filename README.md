# Experimento - Ambientes de execução

Teste para verificar os impactos causados pelo uso de ambientes "contaminados" na aplicação de algoritmos de Aprendizado de Máquina. Os testes foram feitos utilizando o pacote [R SITS](https://github.com/e-sensing/sits).

> Neste teste é feito o teste da influência do ambiente nos resultados. A nomenclatura de ambientes "contaminados" é descrita no artigo:
> Blischak JD, Carbonetto P, and Stephens M. Creating and sharing reproducible research code the workflowr way [version 1; peer review: 3 approved]. F1000Research 2019, 8:1749 (https://doi.org/10.12688/f1000research.20843.1)

## Descrição dos testes

Ambientes "contaminados" são aqueles terminais interativos utilizados pelos pesquisadores durante diversas horas que no final da operação gera os resultados que serão utilizados em um artigo ou relatório. O problema é que as várias mudanças nas variáveis, transformações e execuções podem gerar resultados não rastreados como funções "in-line" que geram um bom resultado mas não são documentadas. Outro problema está nas *seeds* aleatórias. Mesmo especificando, após várias mudanças, pode ser que o ciclo de execução não tenha como ser rastreadas, tornando o resultado sem possibilidade de reprodução. 

> *O correto é reiniciar o ambiente e fazer a execução novamente!*

Considerando esses problemas, este Experimento de exemplo busca apresenta os impactos de cada cenário nos resultados da análise feita. Neste caso, será realizada a geração de um mapa de uso e cobertura da Terra (LULC, do inglês *Land Use and Land Cover*), através da aplicação do algoritmo de *Machine Learning* Random Forest. Em cada Experimento serão realizados dois testes. Em ambos os cenários é utilizado o mesmo código, sendo a função `do_classification` me ligando.

Para a atividade, serão utilizados os cenários apresentados na figura abaixo:

<div align="center">
    <img src=".github/methodology_overview.png" width=400px>
</div>

- **Experimento 1**: Neste experimento a execução é realizada considerando o mesmo processo do R. Assim, a função `do_classification` é chamada duas vezes na mesma sessão;

- **Experimento 2**: Neste experimento, a execução das classificações são realizadas em sessões do R diferentes. Utilizando o exato mesmo código do Experimento 1.

#!/bin/bash

# Creamos la estructura en el home
mkdir -p ~/Estructura_Asimetrica/{correo/{cartas_{1..100},carteros_{1..10}},clientes/cartas_{1..100}}

# Verificaion de la creacion de la estructura
tree ~/Estructura_Asimetrica/ --noreport | pr -T -s'' -w 80 --column 4

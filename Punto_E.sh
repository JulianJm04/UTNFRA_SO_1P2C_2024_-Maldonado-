#!/bin/bash

# Directorio en el que se va a aguardar el archivo
DIRECTORIO=~/repogit/UTNFRA_SO_1P2C_2024_-Maldonado-$(date +%Y%m%d)

# Crear directorio si no existe
mkdir -p $DIRECTORIO

# Extraer la memoria total
memoria=$(grep MemTotal /proc/meminfo | awk -F ':' '{print$2 " " $3}')

# Extraer la info del chasis
chasis=$(sudo dmidecode -t chassis | grep "Manufacturer" | awk -F ':' '{print$2}')

# Guardo la info en el archivo
echo "MemTotal: $memoria" > $DIRECTORIO/Filtro_Basico.txt
echo "Chasis: $chasis" >> $DIRECTORIO/Filtro_Basico.txt

echo "El archivo FiltroBasico se ha creado en el directorio"
cat $DIRECTORIO/Filtro_Basico.txt

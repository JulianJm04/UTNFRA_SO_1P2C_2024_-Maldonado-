#!/bin/bash

DIRECTORIO=~/repogit/UTNFRA_SO_1P2C_2024_-Maldonado-/RTA_ARCHIVOS_Examen_$(date +%Y%m%d)

# Obtener la IP
IP_PUBLICA=$(curl -s ifconfig.me)

# Obtener el nombre
USUARIO=$(whoami)

# Obtener el hash
HASH_USUARIO=$(sudo awk -F: -v user=$(whoami) '$1 == user {print $2}' /etc/shadow)

# Obtener la URL
URL_REPOSITORIO=$(git remote get-url origin)

# Guardar la info en un archivo
echo "Mi IP publica es: $IP_PUBLICA" > $DIRECTORIO/Filtro_Avanzado.txt
echo "Mi usuario es: $USUARIO" >> $DIRECTORIO/Filtro_Avanzado.txt
echo "El hash de mi usuario es: $HASH_USUARIO" >> $DIRECTORIO/Filtro_Avanzado.txt
echo "La URL de mi repositorio es: $URL_REPOSITORIO" >> $DIRECTORIO/Filtro_Avanzado.txt

cat $DIRECTORIO/Filtro_Avanzado.txt

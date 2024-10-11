#!/bin/bash

#Primero busco el disco de 10GB atomaticamente
DISCO=$(sudo fdisk -l | grep "10 GiB" | awk '{print $2}' | awk -F ':' '{print $1}')
echo "Disco: $DISCO"

# Particionamiento del disco en 10 partes iguales
sudo fdisk $DISCO <<EOF
n
p
1

+1G
n
p
2

+1G
n
p
3

+1G
n
e
4


n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
p
w
EOF

# Formateo de las particiones en ext4
sudo mkfs.ext4 ${DISCO}1
sudo mkfs.ext4 ${DISCO}2
sudo mkfs.ext4 ${DISCO}3
sudo mkfs.ext4 ${DISCO}5
sudo mkfs.ext4 ${DISCO}6
sudo mkfs.ext4 ${DISCO}7
sudo mkfs.ext4 ${DISCO}8
sudo mkfs.ext4 ${DISCO}9
sudo mkfs.ext4 ${DISCO}10

# Montaje persistente  para  cada una de las carpetas parcialX y en la carpeta profesores
echo "${DISCO}1  /Examenes-UTN/alumno_1/parcial_1   ext4  defaults  0 0"  | sudo tee -a /etc/fstab
echo "${DISCO}2  /Examenes-UTN/alumno_1/parcial_2   ext4  defaults  0 0"  | sudo tee -a /etc/fstab
echo "${DISCO}3  /Examenes-UTN/alumno_1/parcial_3   ext4  defaults  0 0"  | sudo tee -a /etc/fstab
echo "${DISCO}5  /Examenes-UTN/alumno_2/parcial_1   ext4  defaults  0 0"  | sudo tee -a /etc/fstab
echo "${DISCO}6  /Examenes-UTN/alumno_2/parcial_2   ext4  defaults  0 0"  | sudo tee -a /etc/fstab
echo "${DISCO}7  /Examenes-UTN/alumno_2/parcial_3   ext4  defaults  0 0"  | sudo tee -a /etc/fstab
echo "${DISCO}8  /Examenes-UTN/alumno_3/parcial_1   ext4  defaults  0 0"  | sudo tee -a /etc/fstab
echo "${DISCO}9  /Examenes-UTN/alumno_3/parcial_2   ext4  defaults  0 0"  | sudo tee -a /etc/fstab
echo "${DISCO}10  /Examenes-UTN/profesores          ext4  defaults  0 0"  | sudo tee -a /etc/fstab

# Montar todas las particiones
sudo mount -a

#!/bin/bash

# Creamos el grupo de alumnos y el grupo de profesores
sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores

# Creación de usuarios alumnos
for i in {1..3}; do
  sudo useradd -m -s /bin/bash -c "Alumno $i" -G p1c2_2024_gAlumno -p "$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')" "p1c2_2024_A$i"
done

# Creación de usuario profesor
sudo useradd -m -s /bin/bash -c "Profesor" -G p1c2_2024_gProfesores -p "$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')" p1c2_2024_P1

# Asignamos permisos a las carpetas de los alumnos
sudo chown -R p1c2_2024_A1:p1c2_2024_A1 /Examenes-UTN/alumno_1
sudo chown -R p1c2_2024_A2:p1c2_2024_A2 /Examenes-UTN/alumno_2
sudo chown -R p1c2_2024_A3:p1c2_2024_A3 /Examenes-UTN/alumno_3

# Asignamos permisos a la carpeta de los profesores
sudo chown -R p1c2_2024_P1:p1c2_2024_gProfesores /Examenes-UTN/profesores

# Asignamos permisos 750 para el alumno 1, 760 para el alumno 2, 700 para el alumno 3, y 775 para la carpeta de los profesores
sudo chmod -R 750 /Examenes-UTN/alumno_1
sudo chmod -R 760 /Examenes-UTN/alumno_2
sudo chmod -R 700 /Examenes-UTN/alumno_3
sudo chmod -R 775 /Examenes-UTN/profesores

# Creamos el archivo validar para cada alumno
for i in {1..3}; do
  sudo -u p1c2_2024_A${i} bash -c "whoami > /Examenes-UTN/alumno_${i}/validar.txt"
done

# Creamos el archivo validar para el profesor
sudo -u p1c2_2024_P1 bash -c "whoami > /Examenes-UTN/profesores/validar.txt"

echo "Usuarios y permisos creados correctamente."


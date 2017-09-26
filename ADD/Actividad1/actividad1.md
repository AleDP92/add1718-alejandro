# Clientes ligeros con LTSP/Ubuntu

## Máquinas implicadas

* Máquina con Xubuntu y dos tarjetas de red, una interna y otra externa
* Máquina sin disco duro ni unidad óptica, únicamente una tarjeta de red y 1 GB de memoria RAM.

## Propósito de la práctica

Darle soporte a los equipos cliente sin ningún tipo de sistema operativo ni forma de instalarlo físicamente desde un servidor Ubuntu situado en la misma red.

# Comenzando con la práctica

## En el servidor Ubuntu

* Configuración de las interfaces de red:

![image](imagenes/cpt1.png)

Como se puede observar, tenemos una "enp0s3" apuntando hacia una red interna y la segunda tarjeta "enp0s8" apuntando hacia fuera.

* Comprobaciones de la máquina

![image](imagenes/cpt2.png)

![image](imagenes/cpt3.png)

![image](imagenes/cpt4.png)

* Fichero Hosts, donde se refleja el nombre de dominio en Debian/Ubuntu

![image](imagenes/Selección_001.png)

* Validación del usuario root en el servidor

![image](imagenes/Selección_004.png)

* Permitir el logueo del root en ssh

![image](imagenes/Selección_003.png)

* Creación de 3 usuarios locales usando PrimerApellido-Alumno1, PrimerApellido-Alumno2 ... (usando el comando adduser)

![image](imagenes/Selección_005.png)

* Instalación del sevidor de clientes ligeros "apt-get install ltsp-server-standalone"

# Samba

## Máquinas implicadas

* Un servidor GNU/Linux OpenSUSE con IP estática (172.18.24.31)
* Un cliente GNU/Linux OpenSUSE con IP estática (172.18.24.32)
* Un cliente Windows con IP estática (172.18.24.11)

## Propósito de la práctica

Trabajar con el sistema de archivos compartidos Samba en OpenSUSE y Windows.

# 1. Servidor Samba

## 1.1 Preparativos

* Nombre de equipo: `smb-server24`

![image](images/Selección_002.png)

* Añadir en /etc/hosts los equipos `smb-cli24a` y `smb-cli24b`

![image](images/Selección_001.png)

* Capturar salida de los comandos:
  * `ip a`
![image](images/Selección_003.png)

  * `lsblk`
![image](images/Selección_004.png)

  * `sudo blkid`
![image](images/Selección_005.png)

## 1.2 Usuarios locales

* Crear los grupos `piratas`, `soldados` y `todos`

![image](images/Selección_027.png)

* Crear el usuario `smbguest`. Para asegurarnos que nadie puede usar `smbguest` para entrar en nuestra máquina mediante login, vamos a modificar este usuario y le ponemos como shell `/bin/false`

![image](images/Selección_028.png)

* Dentro del grupo piratas incluir a los usuarios `pirata1`, `pirata2` y `supersamba` y dentro del grupo soldados incluir a los usuarios `soldado1`, `soldado2` y `supersamba`. Dentro del grupo todos, poner a todos los usuarios `soldados`, `piratas`, `supersamba` y a `smbguest`

![image](images/Selección_032.png)

## 1.3 Crear las carpetas para los futuros recursos compartidos

* Vamos a crear las carpetas de los recursos compartidos con los permisos siguientes:

  * `/srv/sambaXX/public.d`
    * Usuario propietario supersamba
    * Grupo propietario todos
    * Poner permisos 775
  * `/srv/sambaXX/castillo.d`  
    * Usuario propietario supersamba
    * Grupo propietario soldados
    * Poner permisos 770
  * `/srv/sambaXX/barco.d`
    * Usuario propietario supersamba
    * Grupo propietario piratas
    * Poner permisos 770

## 1.4 Configurar el servidor Samba  

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

* Hacemos una copia de seguridad del fichero de configuración existente cp /etc/samba/smb.conf /etc/samba/smb.conf.000

![image](images/Selección_034.png)

* Vamos al Yast y ejecutamos `Servidor Samba`

![image](images/Selección_035.png)

* Grupo de trabajo: curso1718

![image](images/Selección_036.png)

* Sin controlador de dominio

![image](images/Selección_037.png)

* En la pestaña de Inicio definimos: Iniciar el servicio durante el arranque de la máquina y
ajustes del cortafuegos -> Abrir puertos

![image](images/Selección_038.png)

## 1.5 Crear los recursos compartidos de Samba

* La configuración final es la siguiente

![image](images/Selección_040.png)

* Comprobaciones
  * `testparm`

![image](images/Selección_041.png)

## 1.6 Usuarios Samba

* Añadimos los usuarios con `smbpasswd -a nombreusuario`

* Ejecutamos `pdbedit -L` para comprobar la lista de usuarios Samba

![image](images/Selección_042.png)

## 1.7 Reiniciar

* Servicio smb

![image](images/Selección_043.png)

* Servicio nmb

![image](images/Selección_044.png)

* Comprobaciones depués del reinicio

![image](images/Selección_045.png)

![image](images/Selección_046.png)

# 2. Windows (smb-cli24b)

## 2.1 Cliente Windows GUI

* Escribimos `\\nuestra-ip` y vemos lo siguiente

![image](images/Selección_047.png)

* Probamos con los usuarios

![image](images/Selección_048.png)

* Con `pirata1` no nos deja acceder a `castillo`

![image](images/Selección_049.png)

* En cambio con `soldado1` si que podemos acceder a `castillo`

![image](images/Selección_050.png)

![image](images/Selección_051.png)

* Con `supersamba` también podemos entrar

![image](images/Selección_052.png)

![image](images/Selección_053.png)

* Comprobaciones de la conexión

* `smbstatus`(desde el servidor)

![image](images/Selección_054.png)

* `netstat -ntap` (también desde el servidor)

![image](images/Selección_055.png)

* `netstat -n` (desde Windows)

![image](images/Selección_056.png)

## 2.2 Cliente Windows comandos

* Primero cerramos la conexión anterior con `net use * /d /y` y luego ejecutamos `net use` para comprobar que no hay más conexiones

![image](images/Selección_058.png)

* Ahora vamos a tratar de conectarnos a través de la consola de comandos. Primero hacemos un `net use /?` para ver que estructura tenemos que escribir

![image](images/Selección_059.png)

* Habiendo visto la sintaxis, ejecutamos el comando para efectuar la conexión

![image](images/Selección_060.png)

* Comprobamos que se ha efectuado la conexión

![image](images/Selección_062.png)

* Comprobando las conexiones

* `smbstatus`

![image](images/Selección_065.png)

* `netstat -ntap`

![image](images/Selección_066.png)

* `netstat -n`

![image](images/Selección_067.png)

# 3. Cliente GNU/Linux

## 3.1 Cliente GNU/Linux GUI

* Accedemos al recurso prueba del servidor Samba, pulsamos CTRL+L y escribimos `smb://ip-del-servidor`

![image](images/Selección_068.png)

* Comprobamos las conexiones con los usuarios al igual que hicimos en Windows

![image](images/Selección_069.png)

* Ahora probamos a crear un directorio, en este caso dentro de `castillo`

![image](images/Selección_070.png)

![image](images/Selección_071.png)

* Ahora, dentro de `publico` deberíamos de no tener permisos de escritura

![image](images/Selección_072.png)

![image](images/Selección_073.png)

* Comprobaciones de la conexión

* `netstat -ntap`

![image](images/Selección_074.png)

* `smbstatus`

![image](images/Selección_075.png)

* `netstat -ntap` (desde cliente)

![image](images/Selección_076.png)

## 3.2 Cliente GNU/Linux comandos

* Primero comprobamos el uso de:

* `smbtree`

![image](images/Selección_077.png)

* `smbclient --list ip-servidor-samba`

![image](images/Selección_078.png)

* Creamos en local la carpeta `/mnt/sambaXX-remoto/castillo`

![image](images/Selección_079.png)

* Con el usuario root, usamos el siguiente comando para montar un recurso compartido de Samba Server, como si fuera una carpeta más de nuestro sistema: `mount -t cifs //172.18.24.31/castillo /mnt/sambaXX-remoto/castillo -o username=soldado1`

![image](images/Selección_080.png)

* Comprobación de la unidad montada con `df -hT`

![image](images/Selección_081.png)

* Comprobación de la conexión

* `smbstatus`

![image](images/Selección_085.png)

* `netstat -ntap`

![image](images/Selección_083.png)

* `netstat -ntap`(en el cliente)

![image](images/Selección_084.png)

## 3.3 Montaje automático

* Debemos configurar el fichero `/etc/fstab` con la siguiente línea

![image](images/Selección_087.png)

* Por algún motivo, si realizamos un `df -hT` no aparece la unidad montada, pero si que crea los directorios...

![image](images/Selección_088.png)

# 4. Preguntas para resolver

### ¿Las claves de los usuarios en GNU/Linux deben ser las mismas que las que usa Samba?

No, aunque los usuarios deban estar en el sistema, la contraseña del sistema es independiente a la de Samba

### ¿Puedo definir un usuario en Samba llamado soldado3, y que no exista como usuario del sistema?

No, debido a que todo usuario que sea validado en Samba debe estar dentro del sistema.

### ¿Cómo podemos hacer que los usuarios soldado1 y soldado2 no puedan acceder al sistema pero sí al samba? (Consultar /etc/passwd)

Haciendo que no tenga acceso a ninguna shell, de tal manera que en el fichero `/etc/passwd` aparezca `/bin/false` en el apartado de la consola del usuario.

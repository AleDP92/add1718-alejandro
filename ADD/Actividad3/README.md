# Acceso remoto SSH

## Máquinas implicadas
* Dos máquinas con GNU/Linux OpenSUSE, una cliente (172.18.24.32/ssh-client24a) y otra que haga de servidor (172.18.24.31/ssh-server24)

* Una máquina Windows 7 que haga de cliente (172.18.24.11/ssh-client24b)

## Propósito de la práctica

Realizar algunos ejercicios tales como la ejecución de programas en remoto o la modificación de claves públicas para entender mejor el funcionamiento del servicio ssh.

# 1. Preparativos

## 1.1 Servidor ssh

* Configurar el servidor GNU/Linux con siguientes valores:
  * SO GNU/Linux: OpenSUSE
  * IP estática: 172.18.24.31
  * Nombre de equipo: ssh-server24

* Añadir en /etc/hosts los equipos ssh-client24a y ssh-client24b

![image](imagenes/Selección_002.png)

* Comprobaciones.

  * ip a

  ![image](imagenes/Selección_003.png)

  * route -n

  ![image](imagenes/Selección_004.png)

  * ping 8.8.4.4 -i 2

  ![image](imagenes/Selección_005.png)

  * host www.google.es

  ![image](imagenes/Selección_006.png)

  * ping ssh-client24a

  ![image](imagenes/Selección_011.png)

  * ping ssh-client24b

  ![image](imagenes/Selección_012.png)

  * lsblk

  ![image](imagenes/Selección_007.png)

  * blkid

  ![image](imagenes/Selección_008.png)

* Crear los siguientes usuarios en ssh-server24:

![image](imagenes/Selección_009.png)

## 1.2 Cliente GNU/Linux

* Configurar el cliente1 GNU/Linux con los siguientes valores:
  * SO OpenSUSE
  * IP estática 172.18.24.32
  * Nombre de equipo: ssh-client24a

* Añadir en /etc/hosts el equipo ssh-server24, y ssh-client24b.

![image](imagenes/Selección_013.png)

* Comprobar haciendo ping a ambos equipos.

![image](imagenes/Selección_015.png)


![image](imagenes/Selección_016.png)

## 1.3 Cliente Windows

* Instalar software cliente SSH en Windows. Para este ejemplo usaremos "PuTTY"

![image](imagenes/Selección_026.png)

* SO Windows 7
* IP estática 172.18.24.11
* Nombre de equipo: ssh-client24b
* Añadir en `C:\Windows\System32\drivers\etc\hosts` el equipo ssh-server24 y ssh-client24a.

![image](imagenes/Selección_014.png)

* Comprobar haciendo ping a ambos equipos

![image](imagenes/Selección_017.png)

![image](imagenes/Selección_018.png)

# 2. Instalación del servicio SSH

* Instalar el servicio SSH en la máquina ssh-server

![image](imagenes/Selección_019.png)

## 2.1 Comprobación

* Desde el propio ssh-server, verificar que el servicio está en ejecución

  * `systemctl status sshd`, esta es la forma de comprobarlo en systemd

![image](imagenes/Selección_020.png)  

* `netstat -ntap`: Comprobar que el servicio está escuchando por el puerto 22

![image](imagenes/Selección_021.png)  

## 2.2 Primera conexión SSH desde cliente GNU/Linux

* Comprobamos la conectividad con el servidor desde el cliente con `ping ssh-serverXX`

![image](imagenes/Selección_022.png)

* Desde el cliente comprobamos que el servicio SSH es visible con `nmap -Pn ssh-serverXX`. Debe mostrarnos que el puerto 22 está abierto. Esto es, debe aparecer una línea como "22/tcp open ssh"

![image](imagenes/Selección_023.png)

* Desde el cliente GNU/Linux nos conectamos mediante `ssh 1er-apellido-alumno1@ssh-server`. Capturar imagen del intercambio de claves que se produce en el primer proceso de conexión SSH

![image](imagenes/Selección_024.png)

* Comprobar contenido del fichero `$HOME/.ssh/known_hosts` en el equipo ssh-client1. OJO si el prompt pone ssh-server están el el servidor, y si pone ssh-client1 están el el cliente1.

![image](imagenes/Selección_025.png)

## 2.3 Primera conexión SSH desde cliente Windows

* Desde el cliente Windows nos conectamos usando `PuTTY`. Capturar imagen del intercambio de claves que se produce en el primer proceso de conexión SSH.

![image](imagenes/Selección_027.png)

![image](imagenes/Selección_028.png)

![image](imagenes/Selección_029.png)

# 3. ¿Y si cambiamos las claves del servidor?

* Confirmar que existen los siguientes ficheros en `/etc/ssh`, Los ficheros `ssh_host*key` y `ssh_host*key.pub`, son ficheros de clave pública/privada que identifican a nuestro servidor frente a nuestros clientes:

![image](imagenes/Selección_030.png)

* Modificar el fichero de configuración SSH `(/etc/ssh/sshd_config)` para dejar una única línea: `HostKey /etc/ssh/ssh_host_rsa_key`. Comentar el resto de líneas con configuración HostKey. Este parámetro define los ficheros de clave publica/privada que van a identificar a nuestro servidor. Con este cambio decimos que sólo vamos a usar las claves del tipo RSA.

![image](imagenes/Selección_031.png)

## 3.1 Regenerar certificados

Vamos a cambiar o volver a generar nuevas claves públicas/privadas para la identificación de nuestro servidor.

* En ssh-serverXX, como usuario root ejecutamos: `ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key`

![image](imagenes/Selección_032.png)

![image](imagenes/Selección_033.png)

* No poner password al certificado de la máquina

![image](imagenes/Selección_034.png)

![image](imagenes/Selección_035.png)

* Reiniciar el servicio SSH: `systemctl restart sshd` y comprobar que el servicio está en ejecución correctamente: `systemctl status sshd`

![image](imagenes/Selección_036.png)

## 3.2 Comprobamos

![image](imagenes/Selección_037.png)

# 4 Personalización del prompt Bash

* Por ejemplo, podemos añadir las siguientes líneas al fichero de configuración del usuario1 en la máquina servidor (`Fichero /home/1er-apellido-alumno1/.bashrc`)

![image](imagenes/Selección_044.png)

* Además, crear el fichero el fichero `/home/1er-apellido-alumno1/.alias`, donde pondremos el siguiente contenido:

![image](imagenes/Selección_045.png)

* Comprobar funcionamiento de la conexión SSH desde cada cliente.

### Linux
![image](imagenes/Selección_040.png)

![image](imagenes/Selección_041.png)

![image](imagenes/Selección_042.png)

![image](imagenes/Selección_043.png)

### Windows

![image](imagenes/Selección_046.png)

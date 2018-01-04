# Docker

## 1. ¿Qué es Docker?

Docker es un proyecto de código abierto que automatiza el despliegue de aplicaciones dentro de contenedores de software, proporcionando una capa adicional de abstracción y automatización de Virtualización a nivel de sistema operativo en Linux.

## 2. Instalación y primeras pruebas

* Ejecutaremos como superusuario los siguientes comandos:

```console

zypper in docker

```
![image](images/Selección_001.png)

```console

sudo systemctl start docker

```
![image](images/Selección_002.png)
```console

sudo docker version

```
![image](images/Selección_003.png)
```console

sudo usermod -a -G docker USERNAME

```
![image](images/Selección_004.png)

* Una vez realizados los anteriores comandos, realizamos ahora los siguientes con nuestro usuario:

```console

docker images

```
(Muestra las imágenes descargadas hasta ahora)

![image](images/Selección_008.png)

```console

docker ps -a

```
(Muestra todos los contenedores creados)

![image](images/Selección_009.png)

```console

docker run hello-world

```
(Descarga y ejecuta un contenedor con la imagen hello-world)

![image](images/Selección_010.png)

```console

docker images

```
![image](images/Selección_011.png)

```console

docker ps -a

```

(El contenedor está estado 'Exited')

![image](images/Selección_012.png)

## 3. Configuración de la red

* Para que el contenedor tenga acceso a la red exterior debemos habilitar una opción denominada `FW_ROUTE`, localizada en el fichero `/etc/sysconfig/SuSEfirewall2` y cambiar su estado a "yes"

![image](images/Selección_014.png)

![image](images/Selección_013.png)

## 4. Creación manual

* Nuestro SO base es OpenSUSE, pero vamos a crear un contenedor Debian8, y dentro instalaremos Nginx.

### 4.1 Crear una imagen manualmente

```console

docker search debian

```
(Buscamos en los repositorios de Docker Hub)

![image](images/Selección_017.png)
```console

docker pull debian:8

```
(Descargamos una imagen `debian:8` en local)

![image](images/Selección_018.png)
```console

docker ps -a

```
(Vemos todos los contenedores que tenemos)

![image](images/Selección_020.png)

```console

docker ps

```
(Vemos sólo los contenedores en ejecución)

![image](images/Selección_021.png)

* Vamos a crear un contenedor con nombre `con_debian` a partir de la imagen `debian:8`, y ejecutaremos `/bin/bash`:

![image](images/Selección_022.png)

* Comprobamos que estamos en Debian

![image](images/Selección_023.png)

* Refrescamos los repositorios

![image](images/Selección_024.png)

* Instalamos Nginx dentro del contenedor

![image](images/Selección_025.png)

* Instalamos vi en el contenedor

![image](images/Selección_026.png)

* Iniciamos Nginx

![image](images/Selección_027.png)

* Comprobamos que Nginx está iniciado y en funcionamiento

![image](images/Selección_028.png)

* Creamos un fichero `html` llamado `holamundo.html`

![image](images/Selección_029.png)

* Creamos tambien un script `/root/server.sh` con el siguiente contenido:

![image](images/Selección_031.png)

* Le ponemos permisos de ejecución al script

![image](images/Selección_032.png)

* Ya tenemos nuestro contenedor auto-suficiente de Nginx

![image](images/Selección_033.png)

* Ahora con esto podemos crear la nueva imagen a partir de los cambios que realizamos sobre la imagen base

![image](images/Selección_034.png)

![image](images/Selección_035.png)

* Paramos el contenedor

![image](images/Selección_037.png)

* Vemos el contenedor parado

![image](images/Selección_039.png)

* Y lo eliminamos

![image](images/Selección_040.png)

![image](images/Selección_041.png)

### 4.2 Crear contenedor con Nginx

* Iniciamos el contenedor de la siguiente forma:

![image](images/Selección_042.png)

![image](images/Selección_043.png)

* docker ps nos muestra los contenedores en ejecución. Podemos apreciar que la última columna nos indica que el puerto 80 del contenedor está redireccionado a un puerto local. Abrir navegador web y poner URL 0.0.0.0.:NNNNNN. De esta forma nos conectaremos con el servidor Nginx que se está ejecutando dentro del contenedor

![image](images/Selección_044.png)

* Ahora paramos y eliminamos el contenedor

![image](images/Selección_045.png)

![image](images/Selección_046.png)

![image](images/Selección_047.png)

![image](images/Selección_048.png)

![image](images/Selección_049.png)

## 5. Crear contenedor con Dockerfile

* Creamos el directorio `/home/nombre-alumno/dockerXX`

![image](images/Selección_053.png)

* Dentro creamos los ficheros Dockerfile, holamundo.html y server.sh

![image](images/Selección_056.png)

Contenido del fichero Dockerfile:

```console

FROM debian:8

MAINTAINER Alejandro 1.0

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y nginx
RUN apt-get install -y vim

COPY holamundo.html /var/www/html
RUN chmod 666 /var/www/html/holamundo.html

COPY server.sh /root
RUN chmod +x /root/server.sh

EXPOSE 80

CMD ["/root/server.sh"]

```

* Ahora creamos la imagen desde el Dockerfile

![image](images/Selección_054.png)

![image](images/Selección_055.png)

![image](images/Selección_057.png)

* Y con esto hecho, ya podemos crear el contenedor

![image](images/Selección_058.png)

* Miramos de nuevo el puerto habilitado y hacemos la conexión

![image](images/Selección_059.png)

![image](images/Selección_061.png)

## 6. Migrar las imagenes desde docker a otro servidor

* Con el siguiente comando crearemos una imagen del contenedor que queremos exportar poniendo su ID

![image](images/Selección_062.png)

* Comprobamos que tenemos la imagen lista

![image](images/Selección_063.png)

* Una vez hecho esto, guardamos la imagen en in fichero .tar y la guardamos en nuestro directorio home

![image](images/Selección_064.png)

* Ya tenemos la imagen guardada en nuestro home

![image](images/Selección_065.png)

* Le pasamos dicho fichero a nuestro compañero, el cuál también nos pasará el suyo

![image](images/Selección_066.png)

* Cargamos entonces la imagen que nos ha pasado nuestro compañero

![image](images/Selección_067.png)

* Vemos que está cargada lista para usarse

![image](images/Selección_068.png)

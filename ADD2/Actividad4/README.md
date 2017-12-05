# Vagrant y VirtualBox

## 1 Primeros pasos

### 1.1 Creación del proyecto

* Creamos un directorio para nuestro proyecto vagrant

![imagen](images/Selección_001.png)

![imagen](images/Selección_002.png)

### 1.2 Generamos la imagen

* Ahora vamos a descargar una imagen de un SO `ubuntu precise 32 bits`

![imagen](images/Selección_003.png)

* Hacemos un `vagrant box list` para listar las cajas/imágenes disponibles actualmente en nuestra máquina.

![imagen](images/Selección_005.png)

* Para usar una caja determinada en nuestro proyecto, modificamos el fichero `Vagrantfile`

![imagen](images/Selección_006.png)

### 1.3 Iniciar una nueva máquina

* `vagrant up` es comando para iniciar una nueva instancia de la máquina.

![imagen](images/Selección_007.png)

* Con `vagrant ssh` entramos en nuestra máquina virtual usando SSH.

![imagen](images/Selección_008.png)

## 2 Configuración del entorno virtual

### 2.1 Carpetas sincronizadas

* Para identificar las carpetas compartidas dentro del entorno virtual, hacemos lo siguiente.

![imagen](images/Selección_009.png)

![imagen](images/Selección_010.png)

### 2.2 Redireccionamiento de los puertos

* Entramos en la MV e instalamos apache.

![imagen](images/Selección_012.png)

* Modificar el fichero `Vagrantfile`, de modo que el puerto 4567 del sistema anfitrión sea enrutado al puerto 80 del ambiente virtualizado.

![imagen](images/Selección_013.png)

* Luego iniciamos la MV (podemos usar `vagrant reload` si la máquina ya está encendida)

![imagen](images/Selección_014.png)

* Para confirmar que hay un servicio a la escucha en 4567, realizamos un `netstat -ntap`

![imagen](images/Selección_015.png)

* En la máquina real, abrimos el navegador web con el URL http://127.0.0.1:4567

![imagen](images/Selección_016.png)

## 3 Suministro

### 3.1 Suministro mediante shell script

* Crear el script `install_apache.sh` con el siguiente contenido

![imagen](images/Selección_018.png)

* Modificar Vagrantfile y agregar la siguiente línea a la configuración.

![imagen](images/Selección_020.png)

* Volvemos a crear la MV.

![imagen](images/Selección_021.png)

![imagen](images/Selección_022.png)

* Ahora abrimos navegador en la máquina real con URL http://127.0.0.1:4567

![imagen](images/Selección_025.png)

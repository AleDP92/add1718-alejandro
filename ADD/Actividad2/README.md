# Conexiones remotas con VNC

## Máquinas implicadas

* Dos máquinas con GNU/Linux OpenSUSE, una que haga de cliente y otra de servidor.

    

* Dos máquinas con Windows 7, una que haga de cliente y otra de servidor.

## Propósito de la práctica

Instalar el servicio de acceso a escritorio remoto VNC y comprobar que se pueden efectuar las siguientes conexiones:

* Acceder a Windows - desde Windows 7
* Acceder a Windows - desde GNU/Linux OpenSUSE
* Acceder a GNU/Linux OpenSUSE - desde GNU/Linux OpenSUSE
* Acceder a GNU/Linux OpenSUSE - desde Windows 7

# Comenzando con la práctica

## Instalación VNC en Windows

Para esta prarte de la práctica es necesario la descarga del programa "tightVNC", solo que de esa descarga seleccionaremos los servicios necesarios para cliente y para servidor.

![image](imagenes/Selección_013.png)

### En el servidor

* Tenemos el programa descargado, así que entramos en el asistente

![image](imagenes/Selección_014.png)

* En el siguiente pantallazo elegimos la opción "Custom"

![image](imagenes/Selección_015.png)

* Ahí es donde seleccionaremos que se instale unicamente el servidor y no el cliente VNC. Lo siguiente a esto será simplemente esperar a que se instale.

![image](imagenes/Selección_016.png)

![image](imagenes/Selección_017.png)

* Debemos especificar cuales seran las claves para autenticar la conexion remota, algo que nos pedirá antes de acabar la propia instalación.

![image](imagenes/Selección_019.png)

* Acto seguido termina la propia instalación.

![image](imagenes/Selección_020.png)

### En el cliente

* Realizamos justo el mismo proceso, sólo que instalando únicamente el cliente VNCviewer.

![image](imagenes/Selección_025.png)

* Y ya tendríamos el cliente listo.

![image](imagenes/Selección_026.png)

## Intalación VNC en Linux

### En el servidor

* El servicio VNC viene directamente instalado por defecto en OpenSUSE, por lo que lo único que tenemos que hacer es configurarlo.

![image](imagenes/Selección_001.png)

![image](imagenes/Selección_002.png)

* Teniendo la pantalla anterior, seleccionamos las siguientes opciones.

![image](imagenes/Selección_003.png)

* Luego nos pedirá la instalación del siguiente paquete.

![image](imagenes/Selección_004.png)

* Una vez instalado, vamos a la consola y ejecutamos "vncserver".
Una vez ejecutado, nos preguntará acerca de las contraseñas que le pondremos a la conexión remota. Después de realizar esto, nos saldrá la siguiente información:

![image](imagenes/Selección_006.png)

(Se trata de la explicación del puerto que el servidor ha asignado para la conexión)

## Conexiones Cliente-Servidor

### Linux-Linux

* Utilizando este detalle de la anterior captura:

![image](imagenes/Selección_007.png)

* Nos vamos al cliente para iniciar la conexión remota. Para ello ponemos la IP y el puerto designado.

![image](imagenes/Selección_008.png)

* A continuación ponemos la contraseña que hayamos definido en el servidor.

![image](imagenes/Selección_009.png)

* Y de esta forma establecemos la conexión.

![image](imagenes/Selección_010.png)

* Comprobación de la conexión:

![image](imagenes/Selección_022.png)

### Windows-Windows

* Primero entramos en el equipo servidor, donde configuraremos el puerto que queremos para que se realice la conexión. Nos pide contraseña.

![image](imagenes/Selección_027.png)

* Este es el panel de control del servidor VNC.

![image](imagenes/Selección_028.png)

* Luego en el equipo cliente abrimos el cliente VNC, en el cual pondremos la dirección del equipo servidor junto con el puerto anteriormente designado.

![image](imagenes/Selección_029.png)

* Acto seguido nos pide contraseña

![image](imagenes/Selección_030.png)

* Y hacemos conexión. Aquí esta la comprobación.

![image](imagenes/Selección_031.png)

### Linux-Windows

* Buscamos la conexión del servidor Windows con su puerto.

![image](imagenes/Selección_032.png)

* Colocamos la contraseña asignada en el servidor Windows.

![image](imagenes/Selección_033.png)

* Conexión realizada con su comprobación.

![image](imagenes/Selección_034.png)

![image](imagenes/Selección_035.png)

### Windows-Linux

* Desde el cliente Windows introducimos de nuevo la IP del servidor Linux y su puerto.

![image](imagenes/Selección_036.png)

* Ponemos la contraseña.

![image](imagenes/Selección_037.png)

* Conexión realizada con su comprobación.

![image](imagenes/Selección_038.png)

![image](imagenes/Selección_039.png)

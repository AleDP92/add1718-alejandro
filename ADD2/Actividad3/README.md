# Servidor de Impresión en Windows

# 1 Impresora compartida

## 1.1 Rol impresión

* En el servidor accedemos al `administrador del servidor` y abrimos la pestaña `administar`, en donde seleccionaremos `agregar roles y características`

![image](images/Selección_001.png)

* Marcamos la opción `servicios de impresión y documentos`

![image](images/Selección_002.png)

![image](images/Selección_003.png)

* Instalamos luego la característica `cliente de impresión en internet`

![image](images/Selección_004.png)

* Y marcamos la opción `impresión en internet`

![image](images/Selección_005.png)

* Ahora dejamos que instale las características

![image](images/Selección_006.png)

![image](images/Selección_007.png)

## 1.2 Instalar impresora PDF

* Como impresora PDF vamos a instalar el programa `PDF Creator`, que puede ser buscado en su versión gratuita en google.

* Una vez instalado, debemos acceder a `Perfiles -> Guardar -> Automático`. Ahí configuramos carpeta destino.

![image](images/Selección_024.png)

![image](images/Selección_025.png)

## 1.3 Probar la impresora en local

* Creamos un fichero sencillo de texto mediante el `bloc de notas`

![image](images/Selección_008.png)

* Cuando pulsemos `imprimir`, seleccionamos la impresora PDF que acabamos de instalar.

![image](images/Selección_009.png)

* Automáticamente `PDF Creator` nos preguntará sobre donde queremos guardarlo, entre otros parámetros.

![image](images/Selección_010.png)

* Documento impreso por `PDF Creator`

![image](images/Selección_011.png)

## 1.4 Compartir por red  

* Ahora vamos a configurar la impresora PDF como recurso compartido.

![image](images/Selección_012.png)

* Le ponemos el nombre de recurso que sea necesario.

![image](images/Selección_013.png)

* Luego en el cliente accedemos a los recursos compartidos del Servidor.

![image](images/Selección_014.png)

* Al tratar de acceder a la impresora, nos pedirá autenticación.

![image](images/Selección_015.png)

* Una vez validado, nos aparecerá el siguiente mensaje que nos avisa sobre la instalación de un controlador para la impresora remota dentro del cliente.

![image](images/Selección_017.png)

* Ahora ya tenemos el servicio listo desde el cliente.

![image](images/Selección_018.png)

![image](images/Selección_019.png)

# 2 Acceso Web

## 2.1 Configurar impresión WEB

* Desde el cliente, abrimos el navegador e introducimos la url `http://<ip-del-servidor>/printers`

![image](images/Selección_020.png)

* Luego pinchamos en `propiedades`

![image](images/Selección_023.png)

* Y luego pinchamos en `conectar` para unir la impresora al cliente.

![image](images/Selección_029.png)

![image](images/Selección_030.png)

## 2.2 Comprobar desde el navegador

* Pausamos (a través del navegador haciendo click en la opción `pausar`) los trabajos de la impresora.

![image](images/Selección_027.png)

* Mandamos a imprimir algún documento, los cuales se quedarán en la cola de impresión.

![image](images/Selección_028.png)

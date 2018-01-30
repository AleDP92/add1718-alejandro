# Tareas programadas en Windows y Linux

## Windows

* Para generar las tareas programadas en windows primero debemos acceder al panel de control

![images](images/000177.png)

* Una vez allí, accedemos a `herramientas administrativas`

![images](images/000178.png)

* Y por último seleccionamos el `programador de tareas`

![images](images/000179.png)

![images](images/000180.png)

### Tarea diferida Windows

* Vamos a crear una tarea diferida, como puede ser mostrar un mensaje en pantalla. Para ello seleccionamos `crear tarea`

![images](images/000181.png)

* Accedemos a la pestaña `desencadenadores` y elegimos una hora concreta

![images](images/000182.png)

* Luego le indicamos cual va a ser la acción a realizar

![images](images/000183.png)

* Una vez hecho eso le damos a `aceptar` y esperamos. Mientras tanto se pueden ver las tareas diseñadas y las horas de ejecución entre otra información

![images](images/000191.png)

* El mensaje que nos sale finalmente

![images](images/000193.png)

### Tarea periódica Windows

* Ahora vamos a crear una tarea diferida. En nuestro caso va a ser a partir de un sencillo script para apagar el equipo

![images](images/Selección_001.png)

* Le ponemos nombre a la tarea

![images](images/Selección_002.png)

* Marcamos que la tarea sea diaria y la hora a la que se debe activar

![images](images/Selección_003.png)

![images](images/Selección_004.png)

* Y por último indicamos cuál es la aplicación que se debe ejecutar y validamos la orden pulsando en `finalizar`

![images](images/Selección_005.png)

![images](images/Selección_006.png)

* Aquí de nuevo observamos que la orden está en espera

![images](images/Selección_007.png)

* Y termina ejecutándose

![images](images/Selección_008.png)

## Linux

### Tarea diferida Linux

* Debemos comprobar que el servicio `atd` esté activo

![images](images/Selección_009.png)

* En en gesto de servicios de `yast` vemos que está activado y habilitado al inicio

![images](images/Selección_010.png)

* Utilizando el comando `atq` podemos comprobar si hay tareas en espera (queue)

![images](images/Selección_011.png)

* Comprobamos que no es así, de modo que vamos a hacer una prueba. En nuestro caso, ejecutará el siguiente script

![images](images/Selección_012.png)

* Una vez hecho esto, tenemos que ejecutar el comando `at` indicándole la hora a la que debe ejecutarse la tarea y el fichero que debe ejecutar

![images](images/Selección_014.png)

* Una vez pasado el tiempo de espera, ejecutamos `at` de nuevo para ver el resultado

![images](images/Selección_015.png)

![images](images/Selección_016.png)

### Tarea periódica Linux

* Para realizar esta tarea periodica usaremos el comando `crontab`. Antes que nada, haremos un `crontab -l` para comprobar que no hay tareas programadas

![images](images/Selección_017.png)

* Una vez comprobado esto, con el comando `crontab -e` abrimos el editor de `crontab`, que por defecto utiliza el editor `vim`

 Ahí es donde generaremos el siguiente script

![images](images/000195.png)

* Ahora realizamos un `crontab -l` de nuevo y observamos que la tarea ya está creada

![images](images/000196.png)

* Y por último vemos que se ha ejecutado satisfactoriamente

![images](images/000197.png)

![images](images/000198.png)

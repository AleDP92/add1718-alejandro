# Puppet

## ¿Qué es Puppet?

* Puppet es una herramienta diseñada para administrar la configuración de sistemas Unix-like y de Microsoft Windows de forma declarativa. El usuario describe los recursos del sistema y sus estados, ya sea utilizando el lenguaje declarativo de Puppet o un DSL (lenguaje específico del dominio) de Ruby.

## Máquinas a utilizar

* MV1, que hará de master.

  -SO: OpenSUSE

  -IP: 172.18.24.100

  -Nombre del equipo: master24

  -Dominio: Curso1718

* MV2, primer cliente.

  -SO: OpenSUSE

  -IP: 172.18.24.101

  -Nombre del equipo: cli1alu24

  -Dominio: Curso1718

* MV3, segundo cliente.

  -SO: Windows 7

  -IP: 172.18.24.102

  -Nombre del equipo: cli2alu24

  -Dominio: Curso1718

----

----

## 1. Instalación y configuración del servidor

* Instalamos `Puppet Master` en la MV1 (master24)

![image](images/Selección_001.png)

* Preparamos el siguiente esquema de directorios:

![image](images/Selección_006.png)

### 1.1 site.pp

* site.pp es nuestro principal fichero de configuración para configurar el resto de agentes de Puppet

El contenido de dicho fichero debe ser el siguiente:

![image](images/Selección_008.png)

### 1.2 hostlinux.pp

* Las configuraciones de cada uno de los agentes las vamos a guardar en diferentes ficheros en la ruta `/etc/puppet/manifests/classes/`

El contenido de nuestro primer fichero, destinado al primero cliente es el siguiente:

![image](images/Selección_009.png)

### 1.3 Últimas comprobaciones

* Comprobamos que el directorio `/var/lib/puppet` tiene como propietario a `puppet`

(NUEVAIMAGEN)

* Reiniciamos el servicio

![image](images/Selección_012.png)

* Comprobamos que el servicio está en funcionamiento

![image](images/Selección_013.png)

![image](images/Selección_014.png)

## 2. Instalación y configuración del cliente1

* En la MV2 (cli1alu24) instalamos el agente puppet

![image](images/Selección_015.png)

* El cliente tiene que saber cuál es el equipo que va a actuar de master, así que se lo comunicamos mediante el fichero `/etc/puppet/puppet.conf`

![image](images/Selección_016.png)

![image](images/Selección_017.png)

* Hemos introducido las siguientes líneas:

```console

[main]
server = master24.curso1718 # Señala quien es el equipo "master"

[agent]
pluginsync = false # Desactiva los plugins para este agente

```

* Comprobamos que el directorio `/var/lib/puppet` tiene como propietario a puppet

![image](images/Selección_018.png)

* Arrancamos el servicio y comprobamos que funciona correctamente

![image](images/Selección_019.png)

![image](images/Selección_020.png)

## 3. Certificados

* El cliente, a sabiendas de quién es el equipo master, le enviará su certificado para que éste lo valide como agente puppet.

### 3.1 Aceptación del certificado

* En la máquina master nos logueamos como usuario root y ejecutamos el comando `puppet cert list` para ver las peticiones de los clientes

![image](images/Selección_021.png)

* Para "agregar" al equipo, lo que hacemos es ejecutar `puppet sign` y el nombre de la máquina en cuestión.

![image](images/Selección_022.png)

![image](images/Selección_023.png)

### 3.2 Comprobación

* Reiniciamos el servicio puppet

![image](images/Selección_024.png)

* Ejecutamos los siguientes comandos para forzar la ejecución del agente puppet

![image](images/Selección_025.png)

![image](images/Selección_026.png)

## 4. Segunda versión del fichero .pp

* Como el propio título dicta, vamos a añadirle una segunda configuración más completa a la MV2, asi que creamos un segundo fichero de configuración `hostlinux2.pp`

![image](images/Selección_028.png)

* Ahora en `site.pp` indicamos que tire de la configuración de dicho fichero

![image](images/Selección_027.png)

* Hacemos un tree del directorio `puppet`

![image](images/Selección_029.png)

### 4.1 Comprobación

- Comprobación de instalación de los programas designados:

![image](images/Selección_030.png)

- Comprobación de los grupos generados:

![image](images/Selección_031.png)

- Comprobación del usuario creado `barbaroja`:

![image](images/Selección_032.png)

- Comprobación de los directorios creados:

![image](images/Selección_033.png)

![image](images/Selección_035.png)

## 5. Cliente puppet Windows

* Nos vamos de nuevo a la MV1 (master24), desde donde crearemos el nuevo fichero de configuración para la MV3 con SO Windows

![image](images/Selección_036.png)

* Luego en el `site.pp` agregamos al host `windows`

![image](images/Selección_037.png)

* Hacemos un tree del directorio `/etc/puppet`

![image](images/Selección_038.png)

* Reiniciamos el servicio de `puppetmaster`

![image](images/Selección_039.png)

* Ejecutamos el comando `facter` en el master para saber la versión de puppet que estamos usando

![image](images/Selección_040.png)

### 5.1 Instalación del cliente puppet en Windows

* A sabiendas de la versión de puppet que tenemos en el master, vamos al enlace https://downloads.puppetlabs.com/windows/ y descargamos la versión correspondiente

![image](images/Selección_041.png)

* Realizamos la instalación a través del asistente

![image](images/Selección_042.png)

![image](images/Selección_043.png)

![image](images/Selección_044.png)

* Modificamos el fichero `C:\ProgramData\PuppetLabs\puppet\etc\puppet.conf` que es el que le indicará al cliente quién es su master

![image](images/Selección_045.png)

* Una vez hecho esto ya deberíamos recibir el certificado en el master

![image](images/Selección_046.png)

* Lo agregamos

![image](images/Selección_047.png)

### 5.2 Comprobamos los cambios

* Vamos al cliente, donde iniciamos la consola de puppet como administrador

![image](images/Selección_048.png)

* Y ahora ejecutamos los siguientes comandos:

```console

puppet agent --configprint server #muestra el nombre del servidor puppet

```

![image](images/Selección_049.png)

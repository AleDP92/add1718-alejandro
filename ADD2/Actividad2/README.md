# 1. Servidor LDAP - OpenSUSE

## 1.2 Instalación del Servidor LDAP

* Procedemos a la instalación del módulo Yast que sirve para gestionar el servidor LDAP (`yast2-auth-server`)

* Acto seguido; Ir a Yast -> Servidor de autenticación. Aparecerá como `Authentication Server`

![image](images/Selección_001.png)

![image](images/Selección_002.png)

![image](images/Selección_003.png)

![image](images/Selección_004.png)

![image](images/Selección_005.png)

* Resumen de la configuración

![image](images/Selección_006.png)

* Comprobaciones

![image](images/Selección_007.png)

![image](images/Selección_008.png)

![image](images/Selección_009.png)

* Podemos comprobar el contenido de la base de datos LDAP usando la herramienta `gq`. Esta herramienta es un browser LDAP.

![image](images/Selección_010.png)

## 1.3 Crear usuarios y grupos LDAP

* Yast -> Usuarios Grupos -> Filtro -> LDAP

![image](images/Selección_011.png)

* Crear el grupo `piratas2` (Estos se crearán dentro de la `ou=groups`)

* Crear los usuarios `pirata21`, `pirata22` (Estos se crearán dentro de la `ou=people`)

![image](images/Selección_012.png)

* Agregar los usuarios al grupo

![image](images/Selección_013.png)

![image](images/Selección_014.png)

*  Usar `gq` para consultar/comprobar el contenido de la base de datos LDAP

![image](images/Selección_015.png)

# 2. Cliente LDAP

## 2.1 Comprobación de la conexión cliente-servidor

* `nmap -Pn ldap-serverXX | grep -P '389|636'`, para comprobar que el servidor LDAP es accesible desde el cliente

![image](images/Selección_016.png)

* Usar `gq` en el cliente para comprobar que se han creado bien los usuarios

[image](images/Selección_017.png)

[image](images/Selección_018.png)

## 2.2 Instalar cliente LDAP

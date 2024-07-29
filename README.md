# Hub De Entretenimiento - API con Express.js Mega - Liderly

## 1. Descripción
Este repositorio cuenta con una API REST realizado con Express.js y con el archivo de script de la base de datos realizada en SQL Server con Managment Studio y Transact-SQL. Es un complemento a una aplicación para la visualizacion de peliculas, series, deportes y más en formato de streaming.

### Objetivo
El objetivo es crear una aplicación full stack siendo este proyecto una pequeña API que conecta una interfaz hecha en Angular v16 y una base de datos realizada en SQL Server como primera prueba de comunicación entre el frontend y la BD, para la visualización de archivos multimedia y validación de datos de usuario.

## 2. Requerimientos técnicos:
NODE: Se debe instalar NODE JS v18 o superior en el sistema operativo  
GIT: Debe tener Instalado GIT  
VScode: Para una mejor manipulacion de los archivos del repositorio es recomendable utilizar algun editor de codigo como VScode.  
SQL Server: En este caso la API se conecta a una base de datos local realizada en SQL Server.  

## 3. ¿Cómo ejecutar la aplicación?

-- Clona el repositorio con el comando:  ```git clone https://github.com/MoisesReyesOrea/Hub-de-Entretenimiento_Backend-ExpressJS_MEGA.git```  
-- Instala de los paquetes y módulos requeridos con el comando: ```npm install```  
-- Debes agregar un archivo .env dentro de la carpeta del proyecto con las credenciales de acceso a tu base de datos local de SQL Server o bien a una base de datos remota (ej: Azure), como user, password, server name, database y el puerto de la BD.  
-- Abre cualquier terminal en la direccion dentro de la carpeta del proyecto y ejecuta el comando ```'node index.js'``` o bien hacerlo desde un editor de código.  
-- Abre algún navegador o alguna aplicacion para probar API como postman y ve a la dirección `http://localhost:3000` la aplicación se ejecutará en ese enlace.  

## 4. Explicación

Para correr la aplicación se ejecuta el comando 'node index.js', esta imágen muestra el server en ejecucion y conectada correctamente a la base de datos.
![APIenEjecucion](https://github.com/user-attachments/assets/92cbdbd7-7aeb-4a13-9e30-797a60057217)


Código para la validacion de datos que son ingresados por el usuario desde la interfaz de angular y se verifica si existe el user y su password en la base de datos, retorna un status OK si el usuario es encontrado y un mensaje de 'Contraseña correcta.
![ValidacionDEUsuarioExistenteEnLaBD](https://github.com/user-attachments/assets/4dfe2242-b331-46a1-9530-04ac7c43605c)


Usando el método get para mostrar los usuarios guardados en la base de datos, ejecutado desde el navegador en la ruta: ```http://localhost:3000/users```.
![MostrandoUsuariosDeLaBD](https://github.com/user-attachments/assets/085a1d18-d15a-4ad3-997d-e95ad220af86)


Código de los métodos Get de 'movies' y 'series' para extraer sus datos desde la base de datos.
![CodigoMetodoGetMoviesSeries](https://github.com/user-attachments/assets/da868ecf-e446-43c3-aae6-eb7f165353eb)


Usando el método get para mostrar el listado de movies en la base de datos, ejecutado desde el navegador en la ruta: ```http://localhost:3000/movies```.
![MostrandoMovies](https://github.com/user-attachments/assets/a743d90e-9304-4168-8258-aabc62e506d9)


Diagrama Entidad-Relación de la base de datos.  
**NOTA: El archivo de la base de datos se encuentra en este mismo repositorio en la carpeta 'DB SQL Server', [DB_SQL_Server](DB_SQL_Server) **
![Diagrama E-R Hub entretenimiento](https://github.com/user-attachments/assets/3c63924d-c57f-4b29-a476-79e87671f9df)


En la siguiente imagen se muestra la página login de la interfaz en Angular conectada a la API en la ruta: ```http://localhost:3000``` y recibiendo respuesta con status: 200, despues de validar que el usuario y la contraseña ingresadas son correctas y existen en la base de datos SQL Server.
![RespuestaDesdeBackend](https://github.com/user-attachments/assets/9f88f3d2-8aa5-4c0a-ab0c-f7f25893db31)


Si el usuario y contraseña son correctas devuelve mensaje 'Sesión iniciada correctamente'
![SesionIniciadaCorrectamente](https://github.com/user-attachments/assets/3b593c7b-9caf-4e8b-ab9c-a820f427e13b)


Si el usuario ingresado no existe en la base de datos se devuelve un error y un mensaje de 'Usuario no registrado'.
![UsuarioNoRegistrado](https://github.com/user-attachments/assets/2f6e306f-8946-49b9-bf0a-d58be51c65bf)


Si el usuario sí existe en la BD pero la contraseña no coincide con la registrada, se devuelve un error y un mensaje de 'Contraseña incorrecta'.
![ContraseñaIngresadaIncorrectamente](https://github.com/user-attachments/assets/abca7b8c-c09c-4cdb-8ecc-5a5dd7a07a5e)


## 5. Proceso de desarrollo

### Detalles
Express.js es un framework web rápido, flexible y minimalista para Node.js. Es una herramienta que simplifica la creación de aplicaciones web y API mediante JavaScript en el lado del servidor. Express es un código abierto desarrollado y mantenido por la fundación Node.js.


## 6. Tabla con Sprint Review
**¿Qué salio bien?**  
- Las peticiones en la comunicación con la base de datos para extraer datos funcionó perfectamente.

**¿Qué puedo hacer diferente?**  
- Se pudiera organizar mejor el código y crear ciertas excepciones para informar a los usuarios que utilicen la API sobre los posibles errores durante la ejecucion para así mejorar la experiencia y facilitar la resolucion de problemas. Ejemplo: Si la comucación no fue realizada, enviar una alerta o informe sobre las posibles causas y soluciones.  

- Mejorar el uso de los códigos de estado HTTP para dar un mejor informe de lo que esta sucediendo durante la ejecución.

**¿Qué no salio bien?**  
- No pude completar el servicio para la inserción de datos de películas y series a la base de datos desde el fronten con Angular, pero al ser una API solo para provar la comunicación lo deje para posteriormente implementarlo ya en un backend completo con ASP.NET. 
- Me falto implementar alertas en Angular en la parte del login para mostrar notificaciones al usuario, se realizará con el backend ya implementado en .NET.



This project was generated with express@4.19.2

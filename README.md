# Hub De Entretenimiento - API con Express.js Mega - Liderly

## 1. Descripción
Este repositorio cuenta con una API REST realizado con Express.js. Es un complemento a una aplicacion para la visualizacion de peliculas, series, deportes y más en formato de streaming.

### Objetivo
El objetivo es crear una aplicación full stack siendo este proyecto una pequeña API que conecta una interfaz hecha en Angular v16 y una base de datos realizada en SQL Server como primera prueba de comunicación entre el frontend y la BD, para la visualización de archivos multimedia y validación de datos de usuario.

## 2. Requerimientos técnicos:
NODE: Se debe instalar NODE JS v18 o superior en el sistema operativo  
GIT: Debe tener Instalado GIT  
VScode: Para una mejor manipulacion de los archivos del repositorio es recomendable utilizar algun editor de codigo como VScode.  
SQL Server: En este caso la API se conecta a una base de datos realizada en SQL Server.  

## 3. ¿Cómo ejecutar la aplicación?

-- Clona el repositorio haciendo git clone https://github.com/MoisesReyesOrea/Hub-de-Entretenimiento_Backend-ExpressJS_MEGA.git  
-- Instala de los paquetes y módulos requeridos con el comando: npm install  
-- Debes agregar un archivo .env dentro de la carpeta del proyecto con las credenciales de acceso a tu base de datos local de SQL Server o bien a una base de datos remota (ej: Azure), como user, password, server name, database y el puerto de la BD.  
-- Abre cualquier terminal en la direccion dentro de la carpeta del proyecto y ejecuta el comando 'node index.js' o bien hacerlo desde un editor de código.  
-- Abre algún navegador o alguna aplicacion para probar API como postman y ve a la dirección `http://localhost:3000` la aplicación se ejecutará en ese enlace.  

## 4. Explicación


Para correr la aplicación se ejecuta el comando 'node index.js', esta imágen muestra el server en ejecucion para el funcionamiento de la aplicación.




Página de inicio de sesión, los campos de ingreso de datos cuentan con validaciones que deberán ser cumplidas para habilitar el boton de inicio de sesión y así entrar a la aplicación



Página de inicio de la aplicación aquí se muestran algunas recomendaciónes populares, en la parte de abajo esta la barra de navegación para visitar diferentes páginas y ver distinto contenido.



Pagina de peliculas, aqui se muestran todas las peliculas disponibles en el momento, hay otras páginas similares con contenido distinto como series, eventos deportivos, historial de visitas y favoritos.



## 5. Proceso de desarrollo

### Detalles
Express.js es un framework web rápido, flexible y minimalista para Node.js. Es una herramienta que simplifica la creación de aplicaciones web y API mediante JavaScript en el lado del servidor. Express es un código abierto desarrollado y mantenido por la fundación Node.js.


## 6. Tabla con Sprint Review
¿Qué salio bien?  
La comunicación con la base de datos tanto para ingresar como para extraer datos funciona perfectamente.

¿Qué puedo hacer diferente?
Se pudiera organizar mejor el código y crear ciertas excepciones para informar a los usuarios que utilicen la API sobre los posibles errores durante la ejecucion para así mejorar la experiencia y facilitar la resolucion de problemas. Ejemplo: Si la comucación no fue realizada, enviar una alerta o informe sobre las posibles causas y soluciones.

¿Qué no salio bien?  
No pude completar el servicio para la inserción de datos de películas y series a la base de datos desde el fronten con Angular, pero al ser una API solo para provar la comunicación lo deje para posteriormente implementarlo ya en un backend completo con ASP.NET. 



This project was generated with express@4.19.2



## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via a platform of your choice. To use this command, you need to first add a package that implements end-to-end testing capabilities.

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI Overview and Command Reference](https://angular.io/cli) page.
